record AdviceSlip {
  slip : Advice
}

module AdviceSlip {
  fun fromResponse(response : Http.Response) : LoadState(AdviceSlip) {
    case (response.status) {
      => LoadState::Error("Something went wrong; status = #{response.status}")
      200 => try {
        object = response.body
          |> Json.parse()
          |> Maybe.toResult("")

        adviceSlip = decode object as AdviceSlip
        LoadState::Loaded(adviceSlip)
      } catch Object.Error => e {
        LoadState::Error("Cannot get an advice.")
      } catch String => e {
        LoadState::Error("Error: #{e}")
      }
    }
  }
}
