// Generated by CoffeeScript 1.7.1
(function() {
  var assert;

  assert = chai.assert;

  describe('deck', function() {
    var dealerHand, deck, hand, playerHand, stand;
    deck = null;
    hand = null;
    playerHand = null;
    dealerHand = null;
    stand = null;
    beforeEach(function() {
      deck = new Deck();
      playerHand = deck.dealPlayer();
      return dealerHand = deck.dealDealer();
    });
    return describe('stand', function() {
      it('should have "stand" method', function() {
        return assert.isFunction(playerHand.stand, 'player can stand!');
      });
      return it('should cause dealer to flip card', function() {
        return assert.strictEqual(dealerHand.at(0).get('revealed'), true);
      });
    });
  });

}).call(this);

//# sourceMappingURL=BlackjackViewSpec.map
