# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # this.get('playerHand').on('change');
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'

    playerHand.on 'add', =>
      if playerHand.minScore() > 21
        result = "You lose..."
        @initialize() if confirm "#{result} Start new game?'"


    playerHand.on 'stand', =>
      dealerHand.at(0).flip()
      # console.log(@get('playerHand').scores())
      while Math.max.apply(null, dealerHand.scores()) < 17
        dealerHand.hit()
        @endGame('You lose...') if Math.max.apply(null, dealerHand.scores()) > 21
      if playerHand.minScore() == Math.max.apply(null, dealerHand.scores())
        @endGame("It's a draw,")
      else if playerHand.minScore() < Math.max.apply(null, dealerHand.scores())
        @endGame('You lose...')
      else
        @endGame("You win!")

  endGame: (result) ->
    @initialize() if confirm "#{result} Start new game?"




