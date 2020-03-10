component TodoEntry {
  property todo : String = ""

  style entry {
    font-size: 2rem;
  }

  style text {
  }

  fun render : Html {
    <li::entry>
      <span::text>
        <{ todo }>
      </span>

      <TodoEntry.Icons.Delete todo={todo} />
    </li>
  }
}
