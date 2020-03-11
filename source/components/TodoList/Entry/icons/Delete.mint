component TodoList.Entry.Icons.Delete {
  connect Stores.Todos exposing { remove as removeTodo }

  property todo : Todo = Todo.empty()

  style deleteIcon {
    cursor: pointer;
    float: right;
    &:after { content: "", clear: both; }
  }

  fun deleteTodo(event : Html.Event) : void {
    removeTodo(todo.id)
  }

  fun render : Html {
    <span::deleteIcon onClick={deleteTodo}>
      "X"
    </span>
  }
}
