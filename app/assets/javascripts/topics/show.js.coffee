$(document).on 'page:change', ->
  showErrorMessage = (inputObj) ->
    messageObj = inputObj.next()
    messageObj.html(inputObj[0].validationMessage)
    messageObj.show()

  hideErrorMessage = (inputObj) ->
    messageObj = inputObj.next()
    messageObj.html('')
    messageObj.hide()
  
  $('.comment-body-form').each ->
    $(@).bind "propertychange change click keyup input paste", ->
      inputLength = $(@).val().length
      inputForm   = $(@).parent()

      if inputLength == 0
        inputForm.removeClass('has-success')
        inputForm.addClass('has-error')
      else if inputLength > 0
        inputForm.removeClass('has-error')
        inputForm.addClass('has-success')
        hideErrorMessage($(@))

    $(@).keypress (e) ->
      ENTER_KEY = 13
      if e.keyCode == ENTER_KEY
        unless this.checkValidity()
          showErrorMessage($(@))
          e.preventDefault()
    return
  return


$(document).on 'page:change', ->
  return unless $(".topics.show").length > 0
  App.Topics.showTimeFormatUpdate()
return

