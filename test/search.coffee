should = require 'should'

describe 'require \'../lib/search\'', () ->
  it 'should not throw an error', () ->
    require '../lib/search'

describe 'require(\'../lib/search\').Search', () ->
  it 'should be non-null', () ->
    should.exist require('../lib/search').Search

describe 'new Search()', () ->
  it 'should be non-null', () ->
    Search = require('../lib/search').Search
    should.exist new Search()

describe 'Search', () ->
  beforeEach () ->
    console.log 'setting up'
    Search = require('../lib/search').Search
    this.search = new Search()
  
  # afterEach = () ->
  
  describe 'remove_choice', () ->
    it 'is undefined initially', () ->
      should.not.exist this.search.remove_choice

    it 'should be customisable', (done) ->
      this.search.remove_choice = () ->
        done()
      should.exist this.search.remove_choice
      this.search.remove_choice()
  
  describe 'is_goal', () ->
    it 'is undefined initially', () ->
      should.not.exist this.search.is_goal

    it 'should be customisable', (done) ->
      this.search.is_goal = () ->
        done()
      should.exist this.search.is_goal
      this.search.is_goal()

  describe 'next_actions', () ->
    it 'is undefined initially', () ->
      should.not.exist this.search.next_actions

    it 'should be customisable', (done) ->
      this.search.next_actions = () ->
        done()
      should.exist this.search.next_actions
      this.search.next_actions()

  describe 'apply_action_to_state', () ->
    it 'is undefined initially', () ->
      should.not.exist this.search.apply_action_to_state

    it 'should be customisable', (done) ->
      this.search.apply_action_to_state = () ->
        done()
      should.exist this.search.apply_action_to_state
      this.search.apply_action_to_state()

  describe 'search()', () ->
    it 'should exist', () ->
      should.exist this.search.search

    it 'should loop asynchronously', (done) ->
      this.search.search_loop = (f, e, c) ->
        done()
      this.search.search null, () ->
        return

    it 'should return the initial state when all states are goals', () ->
      this.search.remove_choice = (frontier) ->
        [frontier[0], frontier[1..]]
      this.search.is_goal = (state) ->
        true
      initial_state =
        data1: 'something',
        data2: 42
      result = this.search.search initial_state
      should.exist result
      result.should.have.length 1
      result[0].should.have.property 'state'
      result[0].state.should.equal initial_state

    it 'should return the initial state when all states are goals (async)', (done) ->
      this.search.remove_choice = (frontier) ->
        [frontier[0], frontier[1..]]
      this.search.is_goal = (state) ->
        true
      initial_state =
        data1: 'something',
        data2: 42
      this.search.search initial_state, (success, result) ->
        should.exist success
        success.should.be.true
        should.exist result
        result.should.have.length 1
        result[0].should.have.property 'state'
        result[0].state.should.equal initial_state
        done()

    it 'should find a path of length 2 if all but the start state are goals', () ->
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
      should.exist result
      result.should.have.length 2
      result[0].should.have.property 'state'
      result[0].state.should.equal initial_state
      result[1].state.should.not.equal initial_state

    it 'should find a path of length 2 if all but the start state are goals (async)', (done) ->
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
        should.exist success
        success.should.be.true
        should.exist result
        result.should.have.length 2
        result[0].should.have.property 'state'
        result[0].state.should.equal initial_state
        result[1].state.should.not.equal initial_state
        done()

  # TODO: Create a test for paths that check back on themselves thus 
  # testing the array 'contains' code and the rejection of the state
