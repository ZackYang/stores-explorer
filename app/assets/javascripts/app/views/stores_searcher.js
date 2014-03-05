(function(){
  namespace('se.views')
  
  se.views.StoresSearcher = Backbone.Marionette.Layout.extend({
    tagName: 'div',
    className: 'span12',
    id: 'search-form',
    
    template: JST['app/templates/stores_searcher'],
    
    events: {
      'submit form': 'searchStores'
    },
    
    onRender: function() {
      $categorySelect = this.$el.find("#searcher_categories");
      _.each(STORES_CATEGORIES, function(category){
        $categorySelect.append($("<option value='" + category + "'>" + category + "</option>"))
      })
    },
    
    searchStores: function(event) {
      _this = this;
      event.preventDefault();
      $(event.target).ajaxSubmit({
        success: function(response) {
          console.log(response)
          _this.collection.reset(response);
        }
      });
    }
  })
  
})()