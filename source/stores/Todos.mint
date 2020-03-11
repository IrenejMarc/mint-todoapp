store Stores.Todos {
  state initialised : Bool = false
  state entries : Map(id, Todo) = Map.empty()

  fun add(text : String) : Promise(Never, Result(Storage.Error, Void)) {
    sequence {
      next {
        entries = entries
          |> Map.set(entry.id, entry)
      }

      persist()
    } catch Storage.Error => e {
      Result::Err(e)
    }
  } where {
    entry = { id = Map.size(entries) + 1, text = text }
  }

  fun remove(id : Number) : Promise(Never, Result(Storage.Error, Void)) {
    sequence {
      next {
        entries = entries
          |> Map.delete(id)
      }

      persist()
    } catch Storage.Error => e {
      Result::Err(e)
    }
  }

  fun find(id : Number) : Maybe(Todo) {
    entries
      |> Map.get(id)
  }

  fun persist : void {
    if (initialised) {
      serialize()
        |> Storage.Local.set("todos")
    } else {
      Result::Ok(void)
    }
  } where {
    serializedEntries = serialize()
  }

  fun serialize : String {
    (encode array)
      |> Json.stringify()
  } where {
    array = entries
      |> Map.values()
  }

  fun deserialize(entriesStr : String) : Map(id, Todo) {

    array
      |> Array.reduce(Map.empty(),
        (acc : Map(id, Todo), entry : Todo) : Map(id, Todo) {
          acc |> Map.set(entry.id, entry)
        })
  } where {
    entries = entriesStr
      |> Json.parse()

    array = case (entries) {
      Maybe::Just json => decode json as Array(Todo) |> Result.withDefault([])
      Maybe::Nothing   => []
    }
  }

  fun fromLocalStorage : Map(String, Todo) {
    Storage.Local.get("todos")
      |> Result.withDefault("[]")
      |> deserialize()
  }

  fun init : void {
    if (initialised) {
      next {}
    } else {
      sequence {
        next { entries = fromLocalStorage() }
        next { initialised = true}
      }
    }
  }
}
