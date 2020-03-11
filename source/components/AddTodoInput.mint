component AddTodoInput {
  connect Stores.Todos exposing { add as addTodo }

  style addTodo {
    input {
      width: 160px;
      height: 24px;
      border: 1px solid black;
      padding: 4px;
      border-radius: 6px;
      width: 100%;
      height: 3rem;
      line-height: 3rem;
    }
  }
  
  get addTodoInput : Dom.Element {
    case (Dom.getElementById("add_todo_input")) {
      Maybe::Just element => element
                          => Dom.createElement("input")
    }
  }

  fun clearInput : void {
    addTodoInput
      |> Dom.setValue("")
  }

  fun add(event : Html.Event) : void {
    sequence {
      Html.Event.preventDefault(event)

      addTodoInput
        |> Dom.getValue()
        |> addTodo()

      clearInput()
    }
  }

  fun render : Html {
    <form::addTodo onSubmit={add}>
      <input
        tabindex="0"
        id="add_todo_input"
        type="text"
        placeholder={Util.randomTodoPlaceholder()} 
      />
    </form>
  }
}
