package com.example.todolist;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class EditeurTodo extends AppCompatActivity {

    int id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editeur_todo);
        Intent intent = getIntent();

        id = intent.getIntExtra("TODO_ID", -1);

        String titre = intent.getStringExtra("TODO_TITLE");
        String todo = intent.getStringExtra("TODO_TODO");
        String date = intent.getStringExtra("TODO_DUETO");
        String personne = intent.getStringExtra("TODO_WITHWHO");
        String comment = intent.getStringExtra("TODO_COMMENT");

        Date d = null;
        try{
            DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
            d = formater.parse(date);
        } catch (ParseException e){
            e.printStackTrace();
        }

        EditText titreChamp = (EditText) findViewById(R.id.titreChamp);
        titreChamp.setText(titre);

        EditText todoChamp = (EditText) findViewById(R.id.todoChamp);
        todoChamp.setText(todo);

        EditText personneChamp = (EditText) findViewById(R.id.NomPersonneChamp);
        personneChamp.setText(personne);

        EditText commentChamp = (EditText) findViewById(R.id.CommentaireChamp);
        commentChamp.setText(comment);

        DatePicker dp = (DatePicker) findViewById(R.id.datePicker);
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        dp.init(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), null);
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

        Intent intent = new Intent();

        intent.putExtra("TODO_ID", id);

        EditText champTitre = (EditText) findViewById(R.id.titreChamp);
        intent.putExtra("TODO_TITRE", champTitre.getText().toString());

        EditText champTodo = (EditText) findViewById(R.id.todoChamp);
        intent.putExtra("TODO_TODO", champTodo.getText().toString());

        DatePicker datePicker = (DatePicker) findViewById(R.id.datePicker);
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, datePicker.getDayOfMonth());
        cal.set(Calendar.MONTH, datePicker.getMonth());
        cal.set(Calendar.YEAR, datePicker.getYear());
        Date d = cal.getTime();

        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
        String s = formater.format(d);
        intent.putExtra("TODO_DUETO", s);

        EditText champPersonne = (EditText) findViewById(R.id.NomPersonneChamp);
        intent.putExtra("TODO_WITHWHO", champPersonne.getText().toString());

        EditText champCommentaire = (EditText) findViewById(R.id.CommentaireChamp);
        intent.putExtra("TODO_COMMENT", champCommentaire.getText().toString());

        setResult(Activity.RESULT_OK, intent);
        finish();
    }

    public void clickAnnuler(View view){
        Intent intent = new Intent();
        setResult(Activity.RESULT_CANCELED, intent);
        finish();
    }
}