(function(){
  namespace('se.views')
  
  se.views.StoresList = Backbone.Marionette.CollectionView.extend({
    itemView: se.views.StoreItem,
    
    tagName: 'tbody',
    
    initialize: function(){
      this.collection.on('reset', this.render, this)
    }
  })
  
})()