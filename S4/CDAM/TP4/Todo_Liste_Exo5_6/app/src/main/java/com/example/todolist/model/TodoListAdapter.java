package com.example.todolist.model;

import android.content.Context;
import android.graphics.Color;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.example.todolist.R;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;

public class TodoListAdapter extends BaseAdapter {

    Context context;
    LayoutInflater layoutInflater;
    TodoListData datas;
    ArrayList<Todo> copieDatas;

    public TodoListAdapter(Context context, TodoListData datas){
        this.context = context;
        this.datas = datas;
        this.layoutInflater = LayoutInflater.from(this.context);
        this.copieDatas = (ArrayList<Todo>) datas.getValuesAsNewList();
        this.orderByTitle();
    }

    @Override
    public int getCount() {
        return this.copieDatas.size();
    }

    @Override
    public Todo getItem(int i) {
        return this.copieDatas.get(i);
    }

    @Override
    public long getItemId(int i) {
        return copieDatas.get(i).getId();
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = (LinearLayout) this.layoutInflater.inflate(R.layout.todoviewer, null);
        } else {
            view = (LinearLayout) view;
        }

        TextView date = (TextView) view.findViewById(R.id.tv_todoviewer_date_id);
        TextView titre = (TextView) view.findViewById(R.id.tv_todoviewer_titre_id);
        TextView todo = (TextView) view.findViewById(R.id.tv_todoviewer_todo_id);
        TextView comment = (TextView) view.findViewById(R.id.tv_todoviewer_wwcomment_id);

        Todo todoRecup = copieDatas.get(i);

        DateFormat formater = new SimpleDateFormat("MMMM d, yyyy", Locale.FRENCH);
        String s = formater.format(todoRecup.getDueTo());

        date.setText(s);

        titre.setText(todoRecup.getId() + " " + todoRecup.getTitle());

        String todoS = todoRecup.getTodo();
        if (todoS.length() > 40){
            todo.setText(todoS.substring(0, 40) + "...");
        } else {
            todo.setText(todoS);
        };

        String commentS = todoRecup.getComment();
        if (commentS.length() > 40){
            comment.setText(todoRecup.getWhithWho() + " " + commentS.substring(0, 40) + "...");
        } else {
            comment.setText(todoRecup.getWhithWho() + " " + commentS);
        }

        if (i % 2 == 0){
            date.setTextColor(Color.BLACK);
            titre.setTextColor(Color.BLACK);
            todo.setTextColor(Color.BLACK);
            comment.setTextColor(Color.BLACK);
        } else {
            date.setTextColor(Color.LTGRAY);
            titre.setTextColor(Color.LTGRAY);
            todo.setTextColor(Color.LTGRAY);
            comment.setTextColor(Color.LTGRAY);
        }

        return view;
    }

    public void add(Todo tdNew){
        datas.add(tdNew);
        this.notifyDataSetChanged();
    }

    public void removeById(int idToRemove){
        for (int i = 0; i < datas.size(); i++)
        {
            Todo t = datas.get(i);
            if (t.getId() == idToRemove){
                datas.removeById(i);
            }
        }
        this.notifyDataSetChanged();
    }

    public void orderByTitle(){
        copieDatas = (ArrayList<Todo>) datas.getValuesAsNewList();
        Collections.sort(copieDatas, new Comparator<Todo>() {
            @Override
            public int compare(Todo t1, Todo t2) {
                return t1.getTitle().compareTo(t2.getTitle());
            }
        });
        this.notifyDataSetChanged();
    }

    public void orderByDate(){
        copieDatas = (ArrayList<Todo>) datas.getValuesAsNewList();
        Collections.sort(copieDatas, new Comparator<Todo>() {
            @Override
            public int compare(Todo t1, Todo t2) {
                return t1.getDueTo().compareTo(t2.getDueTo());
            }
        });
        this.notifyDataSetChanged();
    }

    public void orderById(){
        copieDatas = (ArrayList<Todo>) datas.getValuesAsNewList();
        Collections.sort(copieDatas, new Comparator<Todo>() {
            @Override
            public int compare(Todo t1, Todo t2) {
                return t1.getId() < t2.getId() ? -1 : t1.getId() == t2.getId() ? 0 : 1;
            }
        });
        this.notifyDataSetChanged();
    }
}
