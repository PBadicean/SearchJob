$ ->
  request = placeId: $('#map-canvas').data('place-id')
  map = new (google.maps.Map)(document.getElementById('map-canvas'), zoom: 15)

  callback = (place, status) ->
    if status == google.maps.places.PlacesServiceStatus.OK
      marker = new (google.maps.Marker)(
        map: map
        position: place.geometry.location)
      map.setCenter marker.getPosition()

  service = new (google.maps.places.PlacesService)(map)
  service.getDetails request, callback
