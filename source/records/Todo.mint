record Todo {
  id : Number,
  text : String
}

module Todo {
  fun placeholder() : Todo {
    { id = -1, text = "Loading ... "}
  }

  fun empty() : Todo {
    { id = 0, text = "" }
  }
}
