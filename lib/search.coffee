util = require('util')
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
      console.log 'found callback'
      self = this
      setTimeout () ->
        console.log 'Going async'
        self.search_loop frontier, explored, callback
      , 0
    else
      this.search_loop frontier, explored, callback

  search_loop: (frontier, explored, callback) ->
    console.log 'New loop. Frontier length: ' + frontier.length
    if frontier.length == 0
      if callback?
        callback false
        return
      else
        return false
    [path, frontier] = this.remove_choice frontier
    console.log 'Next path choice: ' + util.inspect path
    s = path[path.length - 1] # s = path.end
    explored[explored.length] = s # add s to explored
    console.log 'Number of explored states: ' + explored.length
    if this.is_goal(s.state)
      console.log 'Goal state found: ' + util.inspect s
      if callback?
        callback true, path
        return
      else
        return path
    for a in this.next_actions(s.state)
      console.log 'Trying actions: ' + util.inspect a
      result = this.apply_action_to_state s.state, a
      console.log 'Action state result: ' + util.inspect result
      if not (result in frontier) and not (result in explored)
        console.log 'New state'
        new_path = path.slice(0)
        new_path[new_path.length] =
          state: result
          action: a
        frontier[frontier.length] = new_path
    if callback != undefined
      self = this
      setTimeout () ->
        console.log 'Looping'
        self.search_loop frontier, explored, callback
      , 0
    else
      this.search_loop frontier, explored, callback
}

exports.Search = Search
