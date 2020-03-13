record Todo {
  id : Number,
  text : String
}

module Todo {
  fun empty : Todo {
    { id = 0, text = "" }
  }
}
