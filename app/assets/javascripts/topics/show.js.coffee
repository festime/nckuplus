$(document).on 'page:change', ->
  return unless $(".topics.show").length > 0
  App.Topics.showTimeFormatUpdate()

