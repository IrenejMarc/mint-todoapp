component TodoList {
  connect Todo exposing { todos, addTodo }


  style todos {
    padding: 4px;
    list-style: none;
    border: 1px solid black;
    border-radius: 6px;
  }

  fun render : Html {
    <ul::todos>
      for (todo of todos) {
        <TodoEntry todo={todo} />
      }
    </ul>
  }

}
