class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<div class="cardimage"><img src="img/cards/<%= rankName %>-<%= suitName %>.png" width=100% height=100%>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

