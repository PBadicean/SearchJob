$ ->
  $('.geocomplete')
    .geocomplete()
    .bind 'geocode:result', (event, result) ->
      $('#candidate_info_attributes_place_id').val(result.place_id)
