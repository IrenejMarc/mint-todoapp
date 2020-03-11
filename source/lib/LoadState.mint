enum LoadState(a) {
  Loading
  Loaded(a)
  Error(String)
}
