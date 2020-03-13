component Main {
  connect Router exposing { page }

  style base {
    font-family: monospace;

    font-size: 3rem;

    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;

    height: 100vh;
    width: 100vw;

    h2 { margin-top: 0; margin-bottom: 0; }
    * { box-sizing: border-box; }
  }

  fun render : Html {
    <div::base class="app-wrapper">
      case (page) {
        Page::Root     => <Pages.Root />
        Page::ViewTodo => <Pages.ViewTodo />
      }
    </div>
  }
}
