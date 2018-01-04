$ ->
  $('.geocomplete')
    .geocomplete()
    .bind 'geocode:result', (event, result) ->
      $('.hidden-geocomplete').val(result.place_id)
