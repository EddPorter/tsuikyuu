Search = () ->
  return

Search.prototype = {
  remove_choice: null

  is_goal: null

  next_actions: null

  apply_action_to_state: null

  search: (initial_state, callback) ->
    frontier = [ [ { state: initial_state, action: null } ] ]
    explored = []
    loop
      console.log 'New loop. Frontier length: ' + frontier.length
      if frontier.length == 0
        callback false if callback?
        return false
      path = this.remove_choice frontier
      console.log 'Next path choice: ' + require('util').inspect path
      s = path[path.length - 1] # s = path.end
      explored[explored.length] = s # add s to explored
      console.log 'Number of explored states: ' + explored.length
      if this.is_goal(s)
        console.log 'Goal state found: ' + require('util').inspect s
        callback true, path if callback?
        return path
      for a in this.next_actions(s)
        result = this.apply_action_to_state s, a
        if not result in frontier and not result in explored
          new_path = path
          new_path[new_path.length - 1] =
            state: result
            action: a
          frontier[frontier.length - 1] = new_path
}

exports.Search = Search
