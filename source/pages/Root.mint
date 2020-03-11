component Pages.Root {
  style base {
    min-width: 75%;
  }

  fun render : Html {
    <main::base>
      <h2>"Todo"</h2>

      <TodoList />
      <AddTodoInput />
    </main>
  }
}
