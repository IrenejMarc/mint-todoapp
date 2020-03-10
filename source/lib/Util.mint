module Util {
  fun randomTodoPlaceholder : String {
    Array.sample(placeholders)
      |> Maybe.withDefault("Feed the dog")
  } where {
    placeholders = [
      "Feed the dog",
      "Throw the cat out the window",
    ]
  }
}
