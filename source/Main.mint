component Main {
  connect Todo exposing { todos }

  style base {
    font-family: monospace;
    font-weight: bold;

    font-size: 3rem;

    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;

    height: 100vh;
    width: 100vw;

    h2 { margin-top: 0; margin-bottom: 0; }
  }

  fun render : Html {
    <div::base>
      <h2>"Todo"</h2>

      <TodoList />
      <AddTodoInput />
    </div>
  }
}
