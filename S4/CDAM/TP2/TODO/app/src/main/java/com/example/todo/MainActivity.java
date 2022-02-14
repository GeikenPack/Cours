package com.example.todo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void afficherMessage(View v)
    {
        DatePicker dp = (DatePicker) findViewById(R.id.datePicker);
        int day = dp.getDayOfMonth();
        int month = dp.getMonth() + 1;
        int year = dp.getYear();

        EditText titre = (EditText) findViewById(R.id.titreChamp);
        String titreS = titre.getText().toString();

        Toast.makeText(getApplicationContext(), titreS + " pour le " + day + "/" + month + "/" + year, Toast.LENGTH_SHORT).show();
    }
}