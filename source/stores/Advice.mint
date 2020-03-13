store Stores.Advice {
  const ADVICE_API_URL = "https://api.adviceslip.com/advice"

  state loadState : LoadState(AdviceSlip) = LoadState::Initial

  get adviceSlip : Maybe(AdviceSlip) {
    loadState
      |> LoadState.toMaybe()
  }

  fun loadRandom : Promise(Never, Void) {
    sequence {
      next { loadState = LoadState::Loading }

      response = ADVICE_API_URL
        |> Http.get()
        |> Http.send()

      newState = response
        |> AdviceSlip.fromResponse()

      next { loadState = newState }
    } catch Http.ErrorResponse => error {
      next { loadState = LoadState::Error("HTTP Error") }
    }
  }
}
