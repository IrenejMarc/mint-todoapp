enum LoadState(a) {
  Initial
  Loading
  Loaded(a)
  Error(String)
}

module LoadState {
  fun toMaybe(loadState : LoadState(a)) : Maybe(a) {
    case (loadState) {
      LoadState::Loaded a => Maybe::Just(a)
                          => Maybe::Nothing
    }
  }
}
