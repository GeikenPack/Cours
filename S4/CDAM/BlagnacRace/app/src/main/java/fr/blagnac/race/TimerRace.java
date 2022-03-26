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
			String[] participants = requeteServeur.doGET("cmd=getParticipants").split(",");


				// To Do

		}
		catch  (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void onFinish() {
	}

}
