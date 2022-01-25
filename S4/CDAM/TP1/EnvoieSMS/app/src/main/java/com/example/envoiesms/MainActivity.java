package com.example.envoiesms;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if ( Build.VERSION.SDK_INT >= Build.VERSION_CODES.M
                && this.checkSelfPermission(android.Manifest.permission.SEND_SMS)
                != PackageManager.PERMISSION_GRANTED )
        {
            requestPermissions( new String[]{android.Manifest.permission.SEND_SMS,}, 1 );
        }
    }

    public void sendSMS(View view)
    {
        Context context = getApplicationContext();
        EditText numeroChamp = (EditText) findViewById(R.id.send_numero);
        String numero = numeroChamp.getText().toString();

        EditText messageChamp = (EditText) findViewById(R.id.send_message);
        String message = messageChamp.getText().toString();

        if (numero.length() >= 4 && message.length() > 0) {
            SmsManager.getDefault().sendTextMessage(numero, null, message, null, null);
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, "Message envoyé", duration);
            toast.show();
        }
    }
}