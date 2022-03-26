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
		String message;
		try {
			do {
				message = requeteServeur.doGET("cmd=getMessage&name="+mainActivity.getMonNom());
				if (message.equals("Perdu")) {
					mainActivity.setCourseFinie(true);
					Toast.makeText(mainActivity.getApplicationContext(), message, Toast.LENGTH_LONG).show();
				}
			} while(!message.equals("None"));
			if (mainActivity.getCourseFinie()) {
				String gagnant = requeteServeur.doGET("cmd=getWinner");
				mainActivity.showAlert("Perdu !!", gagnant+"a atteint la dernière cible");
				mainActivity.desabonnementGPS();
				mainActivity.getTimerRace().cancel();
				requeteServeur.doGET("cmd=removeParticipant&name="+mainActivity.getMonNom());
				return;
			}
			String reponse = requeteServeur.doGET("cmd=getParticipants");
			if (!reponse.equals("None")) {
				String[] participants = reponse.split(",");
				String monNom = mainActivity.getMonNom();
				for (String nom : participants) {
					if (!nom.equals(monNom)) {
						String reponsePos = requeteServeur.doGET("cmd=getPosition&name="+nom);
						String[] coordonnees = reponsePos.split(",");
						LatLng position = new LatLng(Float.parseFloat(coordonnees[0]), Float.parseFloat(coordonnees[1]));
						if (marqueursAdversaires.containsKey(nom)) {
							marqueursAdversaires.get(nom);
							Marker marker = mainActivity.getmMap().addMarker(new MarkerOptions()
									.title(nom).position(position)
									.icon(BitmapDescriptorFactory
											.fromResource(R.drawable.red_droid)));
							marqueursAdversaires.put(nom, marker);
						}
						marqueursAdversaires.get(nom).setPosition(position);
					}
				}
			}

		}
		catch  (IOException e) {
			e.printStackTrace();
		}
		return;
	}

	@Override
	public void onFinish() {
	}

}
