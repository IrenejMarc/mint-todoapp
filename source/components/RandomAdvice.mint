component RandomAdvice {
  connect Stores.Advice exposing { loadState }

  style advice {
  }

  style adviceText {
    font-size: 1rem;
    color: #666;
  }

  style error {
    color: red;
  }

  style loading {
    color: #e3e3e3;
  }

  fun componentDidMount : Promise(Never, Void) {
    getNewAdvice()
  }

  fun getNewAdvice : Promise(Never, Void) {
    Stores.Advice.loadRandom()
  }

  fun render : Html {
    <div::advice onDblClick={getNewAdvice}>
      case (loadState) {
        LoadState::Loaded adviceSlip =>
          <span::adviceText>
            <{ "Advice: #{adviceSlip.slip.advice}" }>
          </span>
        LoadState::Error err =>
          <span::error>
            <{ err }>
          </span>
        =>
          <span::loading>
            "Loading advice ..."
          </span>
      }
    </div>
  }
}
