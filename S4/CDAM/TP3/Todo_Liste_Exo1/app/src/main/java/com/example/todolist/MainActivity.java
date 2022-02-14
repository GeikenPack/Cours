package com.example.todolist;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import com.example.todolist.model.Todo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private ArrayAdapter<Todo> tlAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tlAdapter = new ArrayAdapter<Todo>(this, android.R.layout.simple_list_item_1, createListTodoTest());

        setContentView(R.layout.activity_main);
        ListView lv = findViewById(R.id.listeTodos);
        lv.setAdapter(tlAdapter);
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

}