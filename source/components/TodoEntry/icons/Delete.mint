component TodoEntry.Icons.Delete {
  connect Todo exposing { todos, addTodo, deleteTodo }
  property todo : String = ""

  style deleteIcon {
    cursor: pointer;
    float: right;
    &:after { content: "", clear: both; }
  }

  fun removeTodo(event : Html.Event) : Promise(Never, Void) {
    deleteTodo(todo)
  }

  fun render : Html {
    <span::deleteIcon onClick={removeTodo}>
      "X"
    </span>
  }
}
