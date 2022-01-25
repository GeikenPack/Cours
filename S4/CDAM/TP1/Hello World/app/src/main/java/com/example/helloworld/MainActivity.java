package com.example.helloworld;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "test de nouveau message", duration);
        toast.show();
        setContentView(R.layout.activity_main);
    }

    @Override
    protected void onStart() {
        super.onStart();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onStart", duration);
        toast.show();
    }

    @Override
    protected void onStop() {
        super.onStop();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onStop", duration);
        toast.show();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onDestroy", duration);
        toast.show();
    }

    @Override
    protected void onPause() {
        super.onPause();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onPause", duration);
        toast.show();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onResume", duration);
        toast.show();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Context context = getApplicationContext();
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, "onRestart", duration);
        toast.show();
    }

    public void displayMessage(View view)
    {
        Context context = getApplicationContext();
        EditText editText = (EditText) findViewById(R.id.edit_message);
        String message = editText.getText().toString();
        CharSequence text = "Votre messag est \n" + message;
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, text, duration);
        toast.show();
    }
}