(function(){
  namespace("se.controllers")

  se.controllers.Store = Backbone.Marionette.Controller.extend({
  
    initialize: function() {
      var storeId = this.options['store_id']
      this.store = new se.models.Store({id: storeId});
      this.buildModules();
      this.attachModules();
      this.fetch();
    },
    
    buildModules: function() {
      this.storeDetail = new se.views.StoreDetail({
        model: this.store
      });
    },
    
    attachModules: function() {
      $('#store_detail').replaceWith(this.storeDetail.$el);
      return this;
    },
    
    render: function() {
      this.storeDetail.render()
    },
    
    fetch: function() {
      _this = this;
      this.store.fetch(function() {
        _this.render();
      })
    }
    
  })
  
})()