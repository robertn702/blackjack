assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  playerHand = null
  dealerHand = null
  stand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'stand', ->
    it 'should have "stand" method', ->
      assert.isFunction(playerHand.stand, 'player can stand!')

    it 'should cause dealer to flip card', ->
      assert.strictEqual(dealerHand.at(0).get('revealed'), true)
