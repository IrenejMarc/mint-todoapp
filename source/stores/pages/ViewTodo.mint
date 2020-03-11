store Stores.Pages.ViewTodo {
  state loadState : LoadState(Todo) = LoadState::Loading

  get todo : Maybe(Todo) {
    case (loadState) {
      LoadState::Loaded todo => Maybe::Just(todo)
      => Maybe::Nothing
    }
  }
  
  fun load(id : Number) : Promise(Never, Void) {
    sequence {
      next { loadState = LoadState::Loading }

      next {
        loadState = 
          case (Stores.Todos.find(id)) {
            Maybe::Just todo => LoadState::Loaded(todo)
                             => LoadState::Error("Cannot find Todo ##{id}")
          }
      }
    }
  }
}
