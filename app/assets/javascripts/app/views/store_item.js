(function(){
  namespace('se.views')
  
  se.views.StoreItem = Backbone.Marionette.ItemView.extend({
    template: JST['app/templates/store_item'],
    
    tagName: 'tr',
    
    templateHelpers: {
      presentationID: function() {
        if(this.id) {
          return this.id
        } else {
          return this.source_id
        }
      },
      
      path: function() {
        if (this.source && this.source_id) {
          return "/stores/" + this.source.toLowerCase() + '-' + this.source_id
        } else {
          return "/stores/" + this.id
        }
      }
    }
  })
  
})()