store Todo {
  state todos : Array(String) = ["Implement app", "Show app"]

  fun addTodo(todo : String) : Promise(Never, Void) {
    next { todos = Array.concat([todos, [todo]]) }
  }

  fun deleteTodo(todo : String) : Promise(Never, Void) {
    next { 
      todos =
        Array.select(
          (e : String) : Bool { e != todo },
          todos
        )
    }
  }
}
