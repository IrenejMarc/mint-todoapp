enum Page {
  Root
  ViewTodo
}

routes {
  / {
    parallel {
      Router.go(Page::Root)
      Stores.Todos.init()
    }
  }

  /todo/:id (id : Number) {
    sequence {
      parallel {
        Router.go(Page::ViewTodo)
        Stores.Todos.init()
      }
      Stores.Pages.ViewTodo.load(id)
    }
  }
}
