package com.example.todolist;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.todolist.model.Todo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
            return super.onContextItemSelected(item);
        } else if (id == R.id.listview_menu_modify_todo_id) {
            return super.onContextItemSelected(item);
        }
        else if (id == R.id.listview_menu_remove_todo_id) {
            return super.onContextItemSelected(item);
        }
        return super.onContextItemSelected(item);
    }
}