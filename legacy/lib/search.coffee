util = require 'util'
_ = require 'underscore'

Search = () ->
  return

Search.prototype = {
  remove_choice: null

  is_goal: null

  next_actions: null

  # (state, action)
  # This function must not modify the `state` variable that is passed by
  # reference. Instead, a fresh object _must_ be returned.
  apply_action_to_state: null

  search: (initial_state, callback) ->
    frontier = [ [ { state: initial_state, action: null } ] ]
    explored = []
    if callback != undefined
      self = this
      setTimeout () ->
        self.search_loop frontier, explored, callback
      , 0
    else
      this.search_loop frontier, explored, callback

  search_loop: (frontier, explored, callback) ->
    if frontier.length == 0
      if callback?
        callback false
        return
      else
        return false
    [path, frontier] = this.remove_choice frontier
    s = path[path.length - 1] # s = path.end
    explored[explored.length] = s # add s to explored
    if this.is_goal(s.state)
      if callback?
        callback true, path
        return
      else
        return path
    for a in this.next_actions(s.state)
      result = this.apply_action_to_state s.state, a
      if not (_.any explored, (e) -> e.state == result) and not (_.any frontier, (f) -> _.any f, (r) -> r.state == result)
        new_path = path.slice(0)
        new_path[new_path.length] =
          state: result
          action: a
        frontier[frontier.length] = new_path
    if callback != undefined
      self = this
      setTimeout () ->
        self.search_loop frontier, explored, callback
      , 0
    else
      this.search_loop frontier, explored, callback
}

exports.Search = Search
