package com.example.todolist;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class EditeurTodo extends AppCompatActivity {

    int id;
    Intent intent;
    String mode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editeur_todo);
        intent = getIntent();

        mode = intent.getStringExtra("MODE");

        switch (mode){
            case "Create":
                createMode();
                break;
            case "Show":
                showMode();
                break;
            case "Edit":
                editMode();
                break;
        }

        id = intent.getIntExtra("TODO_ID", -1);
    }

    public void createMode() {

    }

    public void showMode() {
        findViewById(R.id.button_annuler).setVisibility(View.INVISIBLE);

        findViewById(R.id.titreChamp).setVisibility(View.INVISIBLE);
        findViewById(R.id.titre_shown_text).setVisibility(View.VISIBLE);

        findViewById(R.id.todoChamp).setVisibility(View.INVISIBLE);
        findViewById(R.id.todo_shown_text).setVisibility(View.VISIBLE);

        findViewById(R.id.datePicker).setVisibility(View.INVISIBLE);
        findViewById(R.id.datePicker_shown).setVisibility(View.VISIBLE);

        findViewById(R.id.NomPersonneChamp).setVisibility(View.INVISIBLE);
        findViewById(R.id.NomPersonneText).setVisibility(View.VISIBLE);

        findViewById(R.id.CommentaireChamp).setVisibility(View.INVISIBLE);
        findViewById(R.id.CommentaireText).setVisibility(View.VISIBLE);

        String titre = intent.getStringExtra("TODO_TITLE");
        String todo = intent.getStringExtra("TODO_TODO");
        String date = intent.getStringExtra("TODO_DUETO");
        String personne = intent.getStringExtra("TODO_WHITHWHO");
        String comment = intent.getStringExtra("TODO_COMMENT");

        TextView tv;

        System.out.println(personne);
        tv = (TextView) findViewById(R.id.titre_shown_text);
        tv.setText(titre);

        tv = (TextView) findViewById(R.id.todo_shown_text);
        tv.setText(todo);

        tv = (TextView) findViewById(R.id.NomPersonneText);
        tv.setText(personne);

        tv = (TextView) findViewById(R.id.CommentaireText);
        tv.setText(comment);

        Date d = null;
        try{
            DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
            d = formater.parse(date);
        } catch (ParseException e){
            e.printStackTrace();
        }

        DatePicker dp = (DatePicker) findViewById(R.id.datePicker_shown);
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        dp.init(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), null);
    }

    private void editMode() {
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
        switch (mode){
            case "Create":
                clickCreate();
                break;
            case "Show":
                clickShow();
                break;
            case "Edit":
                clickEdit();
                break;
        }

    }

    private void clickCreate() {
        intent = new Intent();

        fillIntent();

        setResult(Activity.RESULT_OK, intent);
        finish();
    }

    private void clickShow() {
        intent = new Intent();

        intent.putExtra("RES", "Show finit");
        setResult(Activity.RESULT_OK, intent);
        finish();
    }

    private void clickEdit() {
        intent = new Intent();

        fillIntent();

        setResult(Activity.RESULT_OK, intent);
        finish();
    }

    private void fillIntent() {
        intent.putExtra("TODO_ID", id);

        EditText champTitre = (EditText) findViewById(R.id.titreChamp);
        System.out.println(champTitre.getText().toString());
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
    }

    public void clickAnnuler(View view){
        intent = new Intent();
        setResult(Activity.RESULT_CANCELED, intent);
        finish();
    }
}