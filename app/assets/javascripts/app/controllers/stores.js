(function(){
  namespace("se.controllers")

  se.controllers.Stores = Backbone.Marionette.Controller.extend({
  
    initialize: function() {
      this.stores = new se.collections.Stores();
      this.buildModules();
      this.attachModules();
      this.render();
    },
    
    buildModules: function() {
      this.storesList = new se.views.StoresList({
        collection: this.stores
      });
      this.storesSearcher = new se.views.StoresSearcher({
        collection: this.stores
      })
    },
    
    attachModules: function() {
      $('#search-form').replaceWith(this.storesSearcher.$el);
      $('#stores-list table tbody').replaceWith(this.storesList.$el);
      return this;
    },
    
    render: function() {
      this.storesList.render();
      this.storesSearcher.render();
      this.storesSearcher.searchStores();
    }
    
  })
  
})()