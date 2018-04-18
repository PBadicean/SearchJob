$ ->
  $('.geocomplete')
    .geocomplete()
    .bind 'geocode:result', (event, result) ->
      $('.latitude-hidden-geocomplete').val(result.geometry.location.lat())
      $('.longitude-hidden-geocomplete').val(result.geometry.location.lng())
