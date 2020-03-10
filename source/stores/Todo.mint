store Todo {
  state initialised : Bool = false
  state localStorageKey : String = "__mint_todo-app__todos"
  state todos : Array(String) = []

  fun init : Promise(Never, Void) {
    if (!initialised) {
      sequence {
        next { todos = localStorageState() }
        next { initialised = true }
      }
    }
    else {
      next {}
    }
  }

  fun localStorageState : Array(String) {
    data
  } where {
    object = 
      Storage.Local.get(localStorageKey)
        |> Result.withDefault("[]")
        |> Json.parse()
        |> Maybe.withDefault(encode todos)

     data = decode object as Array(String)
      |> Result.withDefault(todos)
  }

  fun persist : Result(Storage.Error, Void) {
    Json.stringify(encode todos)
      |> Storage.Local.set(localStorageKey)
  }

  fun addTodo(todo : String) : Promise(Never, Result(Storage.Error, Void)) {
    sequence {
      next { todos = Array.concat([todos, [todo]]) }
      persist()
    } catch Storage.Error => e {
      Result::Err(e)
    }
  }

  fun deleteTodo(todo : String) : Promise(Never, Result(Storage.Error, Void)) {
    sequence {
      next { 
        todos =
          Array.select(
            (e : String) : Bool { e != todo },
            todos
          )
      }
      persist()
    } catch Storage.Error => e {
      Result::Err(e)
    }
  }
}
