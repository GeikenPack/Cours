package com.example.todolist.model;

import com.example.todolist.model.Todo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class TodoListData {

    private ArrayList<Todo> internalTodoList;

	/* Crée un TodoListData.
		Le TodoListData est initialisé => à enlever par la suite (TP suivant)
	*/
	public TodoListData() {

        this.internalTodoList = new ArrayList<Todo>();

        Calendar c = Calendar.getInstance();
        this.internalTodoList.add(new Todo("devoir 1", "Deposer le TP1 de CDAM deja en retard"));
        this.internalTodoList.add(new Todo("devoir 2", "Deposer le TP2 de CDAM deja en retard"));
        this.internalTodoList.add(new Todo("devoir 3", "Deposer le TP3 de CDAM, il est encore temps"));
        this.internalTodoList.add(new Todo("Courses", "Du lait, du beurre et des epinards"));
        this.internalTodoList.add(new Todo("Fete", "Organiser jeudi soir !! avant jeudi soir !!"));
        c.set(2017, 03, 10);
        this.internalTodoList.add(new Todo("devoir 4",
                "Deposer le TP4, il est encore temps", "My colleague", "", c
                .getTime()));
        c.set(2017, 3, 13);
        this.internalTodoList.add(new Todo("PJT", "Preparer rendu pjt",
                "My colleagues", "Ya du taf a faire\nFaut pas trainer",
                c.getTime()));
    }

	/* Taille de la TodoListData
	*  @return	la taille
	*/
    public int size() {
        return this.internalTodoList.size();
    }

	/* Récupération d'un Todo de la TodoListData
	*  @param	position	position du Todo recherché (0<=position<size())
	*  @return	le Todo en position position
	*/
    public Todo get(int position) {
        return this.internalTodoList.get(position);
    }

	/* Ajout d'un Todo dans la TodoListData
	*/
    public boolean add(Todo td) {
        return this.internalTodoList.add(td);
    }

	/* Effacement d'un Todo de la TodoListData
	*  @param	id	id du Todo à enlever
	*/
    public void removeById(int id) {
		int taille = this.internalTodoList.size();
        for (int i = 0; i < taille; i++) {
            Todo d = this.internalTodoList.get(i);
            if (d.getId() == id) {
                this.internalTodoList.remove(d);
                return;
            }
        }
    }

   	/* Liste des Todo de la TodoListData
	*  @return	une (nouvelle) List contenant les Todo 
	*/
	public List<Todo> getValuesAsNewList() {
        return new ArrayList<>(this.internalTodoList);
    }

}
