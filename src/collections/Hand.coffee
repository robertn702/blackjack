class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  stand: ->
    @trigger('stand', this)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  # calcScore: ->
  #   var maxScore = scores[0];
  #   for (var i = 1; i <scores.length; i++) {
  #     if (scores[i] <=21 && scores[i] > maxScore) {
  #       maxScore = scores[i];
  #     }
  #   }
  #   return maxScore;
