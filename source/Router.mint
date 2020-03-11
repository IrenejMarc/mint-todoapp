store Router {
  state page : Page = Page::Root

  fun go(page : Page) : Promise(Never, Void) {
    next { page = page }
  }
}
