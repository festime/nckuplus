pageUpdater = 
  updateTimeFormat: (obj) ->
    unless obj.data('changed')?
      obj.html(moment(obj.html().trim()).fromNow())
      obj.data('changed', true)

module.exports = pageUpdater

