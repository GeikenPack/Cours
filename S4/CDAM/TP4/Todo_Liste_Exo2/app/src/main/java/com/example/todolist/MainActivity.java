package com.example.todolist;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.todolist.model.Todo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener {

    private ArrayAdapter<Todo> tlAdapter;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tlAdapter = new ArrayAdapter<Todo>(this, android.R.layout.simple_list_item_1, createListTodoTest());

        setContentView(R.layout.activity_main);
        ListView lv = findViewById(R.id.listeTodos);
        lv.setAdapter(tlAdapter);
        lv.setOnItemClickListener(this);
        lv.setOnItemLongClickListener(this);
        this.registerForContextMenu(lv);
    }

    private List<Todo> createListTodoTest() {
        ArrayList<Todo> internalTodoList;
        internalTodoList = new ArrayList<>();
        Calendar c = Calendar.getInstance();
        internalTodoList.add(new Todo("devoir 1",
                "Deposer le TP1 de CDAM deja en retard"));
        internalTodoList.add(new Todo("devoir 2",
                "Deposer le TP2 de CDAM deja en retard"));
        internalTodoList.add(new Todo("devoir 3",
                "Deposer le TP3 de CDAM, il est encore temps"));
        internalTodoList.add(new Todo("Courses",
                "Du lait, du beurre et des epinards"));
        internalTodoList.add(new Todo("Fete",
                "Organiser jeudi soir !! avant jeudi soir !!"));
        c.set(2015, 3, 1);
        internalTodoList.add(new Todo("devoir 4",
                "Deposer le TP4, il est encore temps", "My colleague", "", c
                .getTime()));

        c.set(2015, 3, 13);
        internalTodoList.add(new Todo("PJT", "Preparer rendu pjt",
                "My colleagues", "Ya du taf a faire\nFaut pas trainer",
                c.getTime()));
        return internalTodoList;
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

        }
        else if (id == R.id.listview_menu_remove_todo_id) {
            supprimerTodo(item);
        }
        return super.onContextItemSelected(item);
    }

    public void afficherTodo(MenuItem item)
    {
        AlertDialog.Builder aDBuilder = new AlertDialog.Builder(this);
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        Intent intent;
        intent = new Intent(this, AfficheurTodo.class);
        Todo todoAct = tlAdapter.getItem(info.position);
        intent.putExtra("TODO_ID", todoAct.getId());

        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
        String s = formater.format(todoAct.getDueTo());
        intent.putExtra("TODO_DUETO", s);
        intent.putExtra("TODO_COMMENT", todoAct.getComment());
        intent.putExtra("TODO_TODO", todoAct.getTodo());
        intent.putExtra("TODO_TITLE", todoAct.getTitle());
        intent.putExtra("TODO_WHITHWHO", todoAct.getTitle());
        startActivityForResult(intent, 100);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case 100:
                if (resultCode == Activity.RESULT_CANCELED) {
                    Toast.makeText(getApplicationContext(), "TodoShow annulé", Toast.LENGTH_SHORT).show();
                } else if (resultCode == Activity.RESULT_OK) {
                    String valeurRes = data.getStringExtra("RES");
                    Toast.makeText(getApplicationContext(), "Valeur RES " + valeurRes, Toast.LENGTH_SHORT).show();
                }
                break;
            default:
                break;
        }
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.main_menu_ajouter_todo_id){
            Toast.makeText(getApplicationContext(), "Test menu ajouter todo", Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_options, menu);
        return super.onCreateOptionsMenu(menu);
    }

    private void supprimerTodo(MenuItem item){
        AlertDialog.Builder aDBuilder = new AlertDialog.Builder(this);
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        aDBuilder.setTitle("Supprimer vraiment ?");
        aDBuilder.setMessage(tlAdapter.getItem((int) info.id) + "");
        //item.g
        aDBuilder.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                tlAdapter.remove(tlAdapter.getItem((int) info.id));
                tlAdapter.notifyDataSetChanged();
                dialogInterface.dismiss();
            }
        });
        aDBuilder.setNegativeButton("Annuler", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        });
        aDBuilder.setCancelable(false);
        AlertDialog alert = aDBuilder.create();
        alert.show();
    }
}