component AddTodoInput {
  connect Todo exposing { addTodo }
  
  style addTodo {

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
      clearInput()
      addTodo(text)
    }
  } where {
    text = Dom.getValue(addTodoInput)
  }

  fun render : Html {
    <form::addTodo onSubmit={add}>
      <input tabindex="0" id="add_todo_input" type="text" placeholder={Util.randomTodoPlaceholder()} />
    </form>
  }
}
