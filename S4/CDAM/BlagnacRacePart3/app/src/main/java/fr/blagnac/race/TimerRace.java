package fr.blagnac.race;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;

import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

import android.os.CountDownTimer;
import android.widget.Toast;

public class TimerRace extends CountDownTimer{
	private final MapsActivity mainActivity;
	private HashMap<String,Marker> marqueursAdversaires;

	public TimerRace(MapsActivity mainAct, long millisInFuture, long countDownInterval) {
		super(millisInFuture, countDownInterval);
		this.mainActivity=mainAct;
		this.marqueursAdversaires = new HashMap<String,Marker>();
	}

	@Override
	public void onTick(long millisUntilFinished) {
		RequeteHTTP requeteServeur = new RequeteHTTP(mainActivity.getAdresse_serveur());
		try {
			String reponse = requeteServeur.doGET("cmd=getParticipants");
			if (!reponse.equals("None")) {
				String[] participants = reponse.split(",");
				String monNom = mainActivity.getMonNom();
				for (String nom : participants) {
					if (!nom.equals(monNom)) {
						reponse = requeteServeur.doGET("cmd=getPosition&name="+nom);
						String[] coordonnees = reponse.split(",");
						LatLng position = new LatLng(Float.parseFloat(coordonnees[0]),
													 Float.parseFloat(coordonnees[1]));
						Marker marker;
						if (marqueursAdversaires.containsKey(nom)) {
							marker = marqueursAdversaires.get(nom);
						} else {
							marker = mainActivity.getmMap().addMarker(new MarkerOptions()
												 .title(nom).position(position)
												 .icon(BitmapDescriptorFactory
												 .fromResource(R.drawable.red_droid)));
							marqueursAdversaires.put(nom, marker);
						}
						marker.setPosition(position);
					}
				}
			}
		}
		catch  (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void onFinish() {
	}

}
