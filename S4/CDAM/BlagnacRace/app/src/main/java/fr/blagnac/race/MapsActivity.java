package fr.blagnac.race;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentActivity;

import androidx.appcompat.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

import java.io.IOException;
import java.net.MalformedURLException;

import fr.blagnac.race.databinding.ActivityMapsBinding;

public class MapsActivity extends AppCompatActivity implements OnMapReadyCallback, LocationListener {

    private GoogleMap mMap;
    private LocationManager locationManager;
    private ActivityMapsBinding binding;
    private TextView cibleTv;
    private Location cibleLoc;
    private Marker myMarker;
    private Marker cibleMarker;
    private String adresse_serveur;
    private String monNom;
    private Boolean courseFinie=false;
    private TimerRace timerRace;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        binding = ActivityMapsBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M
                && this.checkSelfPermission(android.Manifest.permission.ACCESS_COARSE_LOCATION)
                != PackageManager.PERMISSION_GRANTED
                && this.checkSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(
                    new String[]{android.Manifest.permission.ACCESS_COARSE_LOCATION,
                            android.Manifest.permission.ACCESS_FINE_LOCATION},
                    1);
        }

        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;
        mMap.getUiSettings().setZoomControlsEnabled(true); // affiche les boutons de zoom
        mMap.getUiSettings().setZoomGesturesEnabled(true); // autorise le zoom tactile
        mMap.getUiSettings().setCompassEnabled(false); // n'affiche pas le compas
        mMap.getUiSettings().setMyLocationButtonEnabled(true); // affiche le bouton de localisation
        String cibleDesc = "Inconnue"; // description de la cible
        double cibleLat = 43.6489983; // coordonn??es (latitude, longitude)
        double cibleLon = 1.3749359; // de l???IUT de Blagnac
        cibleLoc = new Location("Cible") ;
        cibleLoc.setLatitude(cibleLat);
        cibleLoc.setLongitude(cibleLon);
        cibleTv = (TextView)findViewById(R.id.tv);
        String cibleTexte = " Cible : " + cibleDesc;
        cibleTv.setText(cibleTexte);
        myMarker = mMap.addMarker(new MarkerOptions()
                .title("Moi").position(new LatLng(0, 0))
                .icon(BitmapDescriptorFactory
                        .fromResource(R.drawable.green_droid))); // Icone Droid vert
        cibleMarker = mMap.addMarker( new MarkerOptions()
                .title("Cible").snippet(cibleDesc)
                .position(new LatLng(cibleLat,cibleLon))
                .icon(BitmapDescriptorFactory
                        .defaultMarker(BitmapDescriptorFactory.HUE_BLUE)) );
        desabonnementGPS();
        timerRace = new TimerRace(this, 86400000, 5000);
        new RejoindreCourse(this).show();
    }

    @Override // m??thode appel??e quand une source de localisation est activ??e
    public void onProviderEnabled(final String provider) {
        if ("gps".equals(provider)) { // Si le GPS est activ?? on s'abonne
            abonnementGPS();
        }
    }

    @Override // m??thode appel??e quand une source de localisation est d??sactiv??e
    public void onProviderDisabled(final String provider) {
        if ("gps".equals(provider)) { // Si le GPS est d??sactiv?? on se d??sabonne
            desabonnementGPS();
        }
    }

    @Override // m??thode appel??e quand les coordonn??es GPS du smartphone changent
    public void onLocationChanged(final Location myLoc) {
        if (this.adresse_serveur == null) {return;}
        RequeteHTTP requeteServeur = new RequeteHTTP(adresse_serveur);
        String message;
        try {
            do {
                message = requeteServeur.doGET("cmd=getMessage&name="+monNom);
                if (message.equals("Perdu")) {
                    courseFinie = true;
                    Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
                }
            } while(!message.equals("None"));
            if (courseFinie) {
                String gagnant = requeteServeur.doGET("cmd=getWinner");
                showAlert("Perdu !!", gagnant+"a atteint la derni??re cible");
                this.desabonnementGPS();
                timerRace.cancel();
                requeteServeur.doGET("cmd=removeParticipant&name="+monNom);
                return;
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // R??cup??ration des cordonn??es (latitude, longitude) et cr??ation d???un objet
        // myPos de la classe LatLng repr??sentant cette position
        final LatLng myPos = new LatLng(myLoc.getLatitude(), myLoc.getLongitude());

        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(myPos, 15));
        myMarker.setPosition(myPos);
        double distance = myLoc.distanceTo(cibleLoc);
        myMarker.setSnippet("?? "+ Math.round(distance) + " m de la cible");
        myMarker.showInfoWindow();
        try {
            requeteServeur.doGET("cmd=setPosition&name="+monNom+"&lat="+myPos.latitude+"&lon="+myPos.longitude);
            if (distance < 30.0) {
                String messageAdversaire;
                String numCible = requeteServeur.doGET("cmd=setGoalReached&name="+monNom);
                if (numCible.equals("3")){
                    this.showAlert("Gagn?? !!", "Vous avez atteint la derniere cible");
                    this.desabonnementGPS();
                    timerRace.cancel();
                    messageAdversaire = "Perdu";
                    requeteServeur.doGET("cmd=removeParticipant&name="+monNom);
                }
                else {
                    this.showAlert("Bravo !!", "Vous avez atteint la cible");
                    String reponse = requeteServeur.doGET("cmd=getGoal&name=" + monNom);
                    String[] cible = reponse.split(",");

                    this.getCibleTv().setText("Cible  : "+cible[0]);
                    this.getCibleLoc().setLatitude(Float.parseFloat(cible[1]));
                    this.getCibleLoc().setLongitude(Float.parseFloat(cible[2]));
                    this.getCibleMarker().setPosition(new LatLng(this.getCibleLoc().getLatitude(), this.getCibleLoc().getLongitude()));

                    mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(myPos, 15));
                    myMarker.setPosition(myPos);
                    distance = myLoc.distanceTo(cibleLoc);
                    myMarker.setSnippet("?? "+ Math.round(distance) + " m de la cible");
                    myMarker.showInfoWindow();
                    messageAdversaire = monNom+" a atteint la cible "+numCible;
                }
                String reponse = requeteServeur.doGET("cmd=getParticipants");
                String[] participants = reponse.split(",");
                for (String nom : participants) {
                    if (!nom.equals(monNom)) {
                        requeteServeur.doGET("cmd=sendMessage&name="+nom+"&msg="+messageAdversaire);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override // m??thode appel??e quand le status d???une source de localisation change
    public void onStatusChanged(final String provider, final int status, final Bundle extras) {
    }

    public void abonnementGPS() throws SecurityException {
// demande de r??ception de localisations du GPS au minimum toutes les 5000 ms et
// lorsque la distance entre la derni??re localisation re??ue est sup??rieure ?? 10 m
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 10, this);
    }

    public void desabonnementGPS() throws SecurityException {
        locationManager.removeUpdates(this);
    }

    @Override
    public void onPause() {
        super.onPause();
// On appelle la m??thode pour se d??sabonner
        desabonnementGPS();
    }

    @Override
    public void onResume() {
        super.onResume();
// Obtention de la r??f??rence du service
        locationManager = (LocationManager) this.getSystemService(LOCATION_SERVICE);
// Si le GPS est disponible, on s'y abonne
        if (locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
            abonnementGPS();
        }
    }

    public void showAlert(String titre, String message) {
        AlertDialog.Builder ADBuilder = new AlertDialog.Builder(this);
        ADBuilder.setTitle(titre);
        ADBuilder.setMessage(message);
        ADBuilder.setCancelable(true);
        ADBuilder.setNeutralButton(android.R.string.ok,
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
        AlertDialog AD = ADBuilder.create();
        AD.show();
    }

    public GoogleMap getmMap() {
        return mMap;
    }

    public void setmMap(GoogleMap mMap) {
        this.mMap = mMap;
    }

    public LocationManager getLocationManager() {
        return locationManager;
    }

    public void setLocationManager(LocationManager locationManager) {
        this.locationManager = locationManager;
    }

    public ActivityMapsBinding getBinding() {
        return binding;
    }

    public void setBinding(ActivityMapsBinding binding) {
        this.binding = binding;
    }

    public TextView getCibleTv() {
        return cibleTv;
    }

    public void setCibleTv(TextView cibleTv) {
        this.cibleTv = cibleTv;
    }

    public Location getCibleLoc() {
        return cibleLoc;
    }

    public void setCibleLoc(Location cibleLoc) {
        this.cibleLoc = cibleLoc;
    }

    public Marker getMyMarker() {
        return myMarker;
    }

    public void setMyMarker(Marker myMarker) {
        this.myMarker = myMarker;
    }

    public Marker getCibleMarker() {
        return cibleMarker;
    }

    public void setCibleMarker(Marker cibleMarker) {
        this.cibleMarker = cibleMarker;
    }

    public String getAdresse_serveur() {
        return adresse_serveur;
    }

    public void setAdresse_serveur(String adresse_serveur) {
        this.adresse_serveur = adresse_serveur;
    }

    public String getMonNom() {
        return monNom;
    }

    public void setMonNom(String monNom) {
        this.monNom = monNom;
    }

    public Boolean getCourseFinie() {
        return courseFinie;
    }

    public void setCourseFinie(Boolean courseFinie) {
        this.courseFinie = courseFinie;
    }

    public TimerRace getTimerRace() {
        return timerRace;
    }
}