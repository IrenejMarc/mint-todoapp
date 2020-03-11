component TodoList {
  connect Stores.Todos exposing { entries as todos }

  style todos {
    padding: 8px;
    list-style: none;
    border: 1px solid black;
    border-radius: 6px;

    a {
      text-decoration: underline;
      color: black;
    }
  }

  fun render : Html {
    <ul::todos>
      for (todo of Map.values(todos)) {
        <TodoList.Entry todo={todo} />
      }
    </ul>
  }

}
