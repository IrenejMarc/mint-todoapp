component TodoList.Entry {
  property todo : Todo = Todo.empty()

  style entry {
    font-size: 2rem;
  }

  style text {
  }

  fun render : Html {
    <li::entry>
      <a href="/todo/#{todo.id}">
        <span::text>
          <{ todo.text }>
        </span>
      </a>

      <TodoList.Entry.Icons.Delete todo={todo} />
    </li>
  }
}
