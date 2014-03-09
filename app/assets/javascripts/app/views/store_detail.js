(function(){
  namespace('se.views')
  
  se.views.StoreDetail = Backbone.Marionette.Layout.extend({
    template: JST['app/templates/store_detail'],
    
    tagName: 'div',
    
    className: 'span12',
    
    events: {
      'click .add_to_db': 'addToDatabase'
    },
    
    initialize: function() {
      this.model.on('change', this.render, this)
      this.model.on('change', this.resetUrl, this)
    },
    
    onRender: function() {
      this.showMap()
    },
    
    addToDatabase: function() {
      if (!this.isStore()) {
        this.model.set('id', null)
        this.model.save()
      }
      // console.log(this.model.isNew())
    },
    
    isStore: function() {
      return !!this.model.get('created_at')
    },
    
    resetUrl: function() {
      if (this.model.get('created_at')) {
        var stateObject = {};
        var title = this.model.get('name');
        var newUrl = "/stores/" + this.model.get('id');
        window.history.pushState(stateObject, title, newUrl);
      }
    },
    
    showMap: function() {
      var myLatlng = new google.maps.LatLng(this.model.get('latitude'), this.model.get('longitude'));
      var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
      }
      var map = new google.maps.Map($(".map_canvas")[0], mapOptions);
      
      var marker = new google.maps.Marker({
        position: myLatlng,
        title: this.model.get("address")
      });
      
      // To add the marker to the map, call setMap();
      marker.setMap(map);
    }
    
  })
  
})()