Search = () -> { }

Search.prototype = {
  remove_choice: null
  set_remove_choice: (rc) ->
    this.remove_choice = rc
  is_goal: null
  set_is_goal: (ig) ->
    this.is_goal = ig
  next_actions: null
  set_next_actions: (na) ->
    this.next_actions = na
  apply_action_to_state: null
  set_apply_action_to_state: (aats) ->
    this.apply_action_to_state = aats
  search: (initial_state, callback) ->
    frontier = [ { state: initial_state, action: null } ]
    explored = []
    loop
      if frontier.length == 0
        callback false if callback?
        return false
      path = remove_choice frontier
      s = path[path.length - 1] # s = path.end
      explored[explored.length] = s # add s to explored
      if is_goal(s)
        callback true, path if callback?
        return path
      for a in next_actions(s)
        result = apply_action_to_state s, a
        if not result in frontier and not result in explored
          new_path = path
          new_path[new_path.length - 1] =
            state: result
            action: a
          frontier[frontier.length - 1] = new_path
}
