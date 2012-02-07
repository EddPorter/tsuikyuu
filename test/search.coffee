nodeunit = require 'nodeunit'

exports['search_moduleExists_success'] = (test) ->
  require '../lib/search'
  test.done()

exports['search_moduleExport_exists'] = (test) ->
  Search = require('../lib/search').Search
  test.notEqual Search, null
  test.done()

exports['search_createNewObject_success'] = (test) ->
  Search = require('../lib/search').Search
  search = new Search()
  test.notEqual search, null
  test.done()

exports['search'] = nodeunit.testCase {
  setUp: (callback) ->
    Search = require('../lib/search').Search
    this.search = new Search()
    callback()
  
  # tearDown: (callback) ->
  
  'checkInitialValueOfRemoveChoice_undefined': (test) ->
    test.equal this.search.remove_choice, undefined
    test.done()
    
  'setRemoveChoiceFunction_success': (test) ->
    this.search.remove_choice = () ->
      test.done()
    test.notEqual this.search.remove_choice, undefined
    this.search.remove_choice()

  'checkInitialValueOfIsGoal_undefined': (test) ->
    test.equal this.search.is_goal, undefined
    test.done()
    
  'setIsGoalFunction_success': (test) ->
    this.search.is_goal = () ->
      test.done()
    test.notEqual this.search.is_goal, undefined
    this.search.is_goal()

  'checkInitialValueOfNextActions_undefined': (test) ->
    test.equal this.search.next_actions, undefined
    test.done()
    
  'setNextActionsFunction_success': (test) ->
    this.search.next_actions = () ->
      test.done()
    test.notEqual this.search.next_actions, undefined
    this.search.next_actions()

  'checkInitialValueOfApplyActionToState_undefined': (test) ->
    test.equal this.search.apply_action_to_state, undefined
    test.done()
    
  'setNextActionsFunction_success': (test) ->
    this.search.apply_action_to_state = () ->
      test.done()
    test.notEqual this.search.apply_action_to_state, undefined
    this.search.apply_action_to_state()

  'searchFunction_exists': (test) ->
    test.notEqual this.search.search, null
    test.done()

  'async_testLoopingPath_success': (test) ->
    this.search.search_loop = (f, e, c) ->
      console.log 'looping'
      test.done()
    this.search.search null, () ->
      return

  'sync_allStatesAreGoals_returnsInitialState': (test) ->
    this.search.remove_choice = (frontier) ->
      [frontier[0], frontier[1..]]
    this.search.is_goal = (state) ->
      true
    initial_state =
      data1: 'something',
      data2: 42
    result = this.search.search initial_state
    test.equal result.length, 1
    test.equal result[0].state, initial_state
    test.done()

  'async_allStatesAreGoals_returnsInitialState': (test) ->
    this.search.remove_choice = (frontier) ->
      [frontier[0], frontier[1..]]
    this.search.is_goal = (state) ->
      true
    initial_state =
      data1: 'something',
      data2: 42
    this.search.search initial_state, (success, result) ->
      test.equal result.length, 1
      test.equal result[0].state, initial_state
      test.done()

  'sync_allButStartStateAreGoals_returnsLengthTwoPath': (test) ->
    initial_state =
      data1: 'stuff'
      data2: 81
    this.search.remove_choice = (frontier) ->
      [frontier[0], frontier[1..]]
    this.search.is_goal = (state) ->
      console.dir state
      state != initial_state
    this.search.next_actions = (state) ->
      ['up']
    this.search.apply_action_to_state = (state, action) ->
      { data1: state.data1, data2: state.data2 + 1 }
    result = this.search.search initial_state
    test.equal result.length, 2
    test.equal result[0].state, initial_state
    test.notEqual result[1].state, initial_state
    test.done()

  'async_allButStartStateAreGoals_returnsLengthTwoPath': (test) ->
    initial_state =
      data1: 'stuff'
      data2: 81
    this.search.remove_choice = (frontier) ->
      [frontier[0], frontier[1..]]
    this.search.is_goal = (state) ->
      console.dir state
      state != initial_state
    this.search.next_actions = (state) ->
      ['up']
    this.search.apply_action_to_state = (state, action) ->
      { data1: state.data1, data2: state.data2 + 1 }
    this.search.search initial_state, (success, result) ->
      test.equal result.length, 2
      test.equal result[0].state, initial_state
      test.notEqual result[1].state, initial_state
      test.done()

  # TODO: Create a test for paths that check back on themselves thus 
  # testing the array 'contains' code and the rejection of the state
}
