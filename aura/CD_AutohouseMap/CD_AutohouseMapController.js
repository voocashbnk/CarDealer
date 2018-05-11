({
   jsLoaded: function(component, event, helper) {
           var map = L.map('map', {zoomControl: true, tap: false, markerZoomAnimation: false})
                     .setView([37.784173, -122.401557], 10);
           L.tileLayer(
           'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
           {
                 attribution: 'Tiles © Esri'
           }).addTo(map);
           component.set("v.map", map);
       },

   autohousesLoaded: function(component, event, helper) {
           map = component.get('v.map');
           var autohouses = event.getParam('autohouses');
           var markers = [];
           var markersPinned = component.get('v.markers');
           if(markersPinned.length > 0){
               markersPinned.forEach(function(marker){
                   console.log(marker);
                   map.removeLayer(marker);
               })
           }

           for (var i=0; i<autohouses.length; i++) {
               var autohouse = autohouses[i];
               if(typeof autohouse.CD_Location__Latitude__s != 'undefined' && typeof autohouse.CD_Location__Longitude__s != 'undefined'){
                   var latLng = [autohouse.CD_Location__Latitude__s, autohouse.CD_Location__Longitude__s];
                   var marker = L.marker(latLng, {autohouse: autohouse});
                   marker.bindPopup(autohouse.Name);
                   markers.push(marker);
               }
           }
           if(markers.length > 0){
               markers.forEach(function(markerToPin){
                   map.addLayer(markerToPin);
               })
               map.panTo([autohouses[0].CD_Location__Latitude__s, autohouses[0].CD_Location__Longitude__s]);
           }
           component.set('v.markers', markers);
       },


   showAutohouseLocalization: function(component, event, helper) {

           map = component.get('v.map');
           var autohouse = event.getParam('autohouse');
           var markers = [];
           var markersPinned = component.get('v.markers');
           if(markersPinned.length > 0){
               markersPinned.forEach(function(marker){
                   console.log(marker);
                   map.removeLayer(marker);
               })
           }

           if(typeof autohouse.CD_Location__Latitude__s != 'undefined' || typeof autohouse.CD_Location__Longitude__s != 'undefined'){
               var latLng = [autohouse.CD_Location__Latitude__s, autohouse.CD_Location__Longitude__s];
               var marker = L.marker(latLng, {autohouse: autohouse});
               marker.bindPopup(autohouse.Name);
               markers.push(marker);
               map.addLayer(marker);
               map.panTo([autohouse.CD_Location__Latitude__s, autohouse.CD_Location__Longitude__s]);
           }
           component.set('v.markers', markers);
       }

})