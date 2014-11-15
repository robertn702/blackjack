# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # this.get('playerHand').on('change');
    playerHand = @get 'playerHand'

    playerHand.on 'add', ->
      if playerHand.minScore() >= 21
        alert "end game"


    playerHand.on 'sort', ->
    # if playerHand.minScore() >= 21
    #   alert "end game"

  calcMinScore: ->
    if playerHand.minScore() >= 21
      alert "end game"
