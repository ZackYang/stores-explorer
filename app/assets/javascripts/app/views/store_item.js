(function(){
  namespace('se.views')
  
  se.views.StoreItem = Backbone.Marionette.ItemView.extend({
    template: JST['app/templates/store_item'],
    
    tagName: 'tr'
  })
  
})()