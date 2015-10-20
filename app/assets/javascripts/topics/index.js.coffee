$(document).on 'page:change', ->
  return unless $(".topics.index").length > 0
  App.updateTimeFormat()

