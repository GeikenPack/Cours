package com.example.todolist;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.todolist.model.ApplicationConstants;
import com.example.todolist.model.Todo;
import com.example.todolist.model.TodoListAdapter;
import com.example.todolist.model.TodoListData;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener {

    private TodoListAdapter tlAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tlAdapter = new TodoListAdapter(this, new TodoListData());

        setContentView(R.layout.activity_main);
        ListView lv = findViewById(R.id.listeTodos);
        lv.setAdapter(tlAdapter);
        lv.setOnItemClickListener(this);
        lv.setOnItemLongClickListener(this);
        this.registerForContextMenu(lv);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        Toast t = Toast.makeText(getApplicationContext(), "Click sur " + i + " id " + l + " titre " + tlAdapter.getItem(i).getTitle(), Toast.LENGTH_SHORT);
        t.show();
    }

    @Override
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
        Toast t = Toast.makeText(getApplicationContext(), "Click long sur " + i + " id " + l + " titre " + tlAdapter.getItem(i).getTitle(), Toast.LENGTH_SHORT);

        t.show();
        return false;
    }


    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.list_todo_menu, menu);
        menu.setHeaderTitle("Choisir une action");
        super.onCreateContextMenu(menu, v, menuInfo);
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.listview_menu_show_todo_id) {
            afficherTodo(item);
        } else if (id == R.id.listview_menu_modify_todo_id) {
            EditerTodo(item);
        } else if (id == R.id.listview_menu_remove_todo_id) {
            supprimerTodo(item);
        }
        return super.onContextItemSelected(item);
    }

    private void EditerTodo(MenuItem item) {
        Intent intent = new Intent(this, EditeurTodo.class);
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        Todo todoAct = tlAdapter.getItem(info.position);
        intent.putExtra("MODE", "Edit");
        intent.putExtra("TODO_ID", todoAct.getId());
        intent.putExtra("TODO_TITLE", todoAct.getTitle());
        intent.putExtra("TODO_TODO", todoAct.getTodo());

        Date date = todoAct.getDueTo();
        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
        String s = formater.format(date);
        intent.putExtra("TODO_DUETO", s);

        intent.putExtra("TODO_WITHWHO", todoAct.getWhithWho());
        intent.putExtra("TODO_COMMENT", todoAct.getComment());
        startActivityForResult(intent, ApplicationConstants.MODIFY_TODO);
    }

    public void afficherTodo(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        Intent intent;
        intent = new Intent(this, EditeurTodo.class);
        Todo todoAct = tlAdapter.getItem(info.position);
        intent.putExtra("MODE", "Show");
        intent.putExtra("TODO_ID", todoAct.getId());

        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
        String s = formater.format(todoAct.getDueTo());
        intent.putExtra("TODO_DUETO", s);

        intent.putExtra("TODO_TITLE", todoAct.getTitle());
        intent.putExtra("TODO_TODO", todoAct.getTodo());
        intent.putExtra("TODO_WHITHWHO", todoAct.getWhithWho());
        intent.putExtra("TODO_COMMENT", todoAct.getComment());
        startActivityForResult(intent, ApplicationConstants.SHOW_TODO);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case ApplicationConstants.SHOW_TODO:
                if (resultCode == Activity.RESULT_CANCELED) {
                    Toast.makeText(getApplicationContext(), "TodoShow annulé", Toast.LENGTH_SHORT).show();
                } else if (resultCode == Activity.RESULT_OK) {
                    String valeurRes = data.getStringExtra("RES");
                    Toast.makeText(getApplicationContext(), "Valeur RES " + valeurRes, Toast.LENGTH_SHORT).show();
                }
                break;
            case ApplicationConstants.MODIFY_TODO:
                if (resultCode == Activity.RESULT_CANCELED) {
                    Toast.makeText(getApplicationContext(), "EditTodo annulé", Toast.LENGTH_SHORT).show();
                } else if (resultCode == Activity.RESULT_OK) {
                    String titre = data.getStringExtra("TODO_TITRE");
                    String todo = data.getStringExtra("TODO_TODO");
                    String date = data.getStringExtra("TODO_DUETO");
                    String personne = data.getStringExtra("TODO_WITHWHO");
                    String comment = data.getStringExtra("TODO_COMMENT");

                    int id = data.getIntExtra("TODO_ID", -1);

                    Date d = null;
                    try {
                        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
                        d = formater.parse(date);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    Todo aAjouter = new Todo(titre, todo, personne, comment, d);
                    for (int i = 0; i < tlAdapter.getCount(); i++) {
                        Todo t = tlAdapter.getItem(i);
                        if (t.getId() == id) {
                            tlAdapter.removeById(t.getId());
                        }
                    }
                    tlAdapter.add(aAjouter);
                    tlAdapter.notifyDataSetChanged();
                }
                break;
            case ApplicationConstants.CREATE_TODO:
                if (resultCode == Activity.RESULT_CANCELED) {
                    Toast.makeText(getApplicationContext(), "CreateTodo annulé", Toast.LENGTH_SHORT).show();
                } else if (resultCode == Activity.RESULT_OK) {
                    String titre = data.getStringExtra("TODO_TITRE");
                    String todo = data.getStringExtra("TODO_TODO");
                    String date = data.getStringExtra("TODO_DUETO");
                    String personne = data.getStringExtra("TODO_WITHWHO");
                    String comment = data.getStringExtra("TODO_COMMENT");

                    Date d = null;
                    try {
                        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
                        d = formater.parse(date);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    Todo aAjouter = new Todo(titre, todo, personne, comment, d);
                    tlAdapter.add(aAjouter);
                    tlAdapter.notifyDataSetChanged();
                    tlAdapter.orderByTitle();
                }
            default:
                break;
        }
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.main_menu_ajouter_todo_id) {
            CreerTodo(item);
        }
        return true;
    }

    private void CreerTodo(MenuItem item) {
        Intent intent = new Intent(this, EditeurTodo.class);
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        intent.putExtra("MODE", "Create");
        startActivityForResult(intent , ApplicationConstants.CREATE_TODO);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_options, menu);
        return super.onCreateOptionsMenu(menu);
    }

    private void supprimerTodo(MenuItem item) {
        AlertDialog.Builder aDBuilder = new AlertDialog.Builder(this);
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        aDBuilder.setTitle("Supprimer vraiment ?");
        aDBuilder.setMessage(tlAdapter.getItem(info.position) + "");
        //item.g
        aDBuilder.setPositiveButton("Ok", (dialogInterface, i) -> {
            System.out.println(info.position);
            tlAdapter.removeById((int) info.id);
            tlAdapter.notifyDataSetChanged();
            dialogInterface.dismiss();
        });
        aDBuilder.setNegativeButton("Annuler", (dialogInterface, i) -> dialogInterface.cancel());
        aDBuilder.setCancelable(false);
        AlertDialog alert = aDBuilder.create();
        alert.show();
    }

    public void triDate(View view) {
        tlAdapter.orderByDate();
    }

    public void triTitre(View view) {
        tlAdapter.orderByTitle();
    }

    public void triId(View view) {
        tlAdapter.orderById();
    }
}