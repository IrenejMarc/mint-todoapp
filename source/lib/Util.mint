module Util {
  fun randomTodoPlaceholder : String {
    Array.sample(placeholders)
      |> Maybe.withDefault("Feed the dog")
  } where {
    placeholders = [
      "Feed the dog",
      "Throw the cat out the window",
      "Check on the alligator",
      "Feed the crows",
      "Stockpile for COVID-19",
      "Bark loudly",
      "Clean your room",
      "Take a shower",
      "Preach about lobsters",
    ]
  }
}
