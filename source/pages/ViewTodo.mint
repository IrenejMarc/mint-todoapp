component Pages.ViewTodo {
  connect Stores.Pages.ViewTodo exposing { todo, loadState }

  style viewTodo {
  }

  style todoText {
  }

  style backButton {
    font-size: 1rem;
    cursor: pointer;
    text-decoration: underline;
    color: black;
  }

  style error {
    color: red;
  }

  fun render : Html {
    <div::viewTodo>
      <a::backButton href="/">"Back"</a>

      case (loadState) {
        LoadState::Loaded todo =>
          <>
            <h2>"Todo ##{todo.id}"</h2>
            <span::todoText> <{ todo.text }> </span>
          </>

        LoadState::Error error =>
          <div::error> <{ error }> </div>

        => <h2>"Loading"</h2>
      }
    </div>
  }
}

