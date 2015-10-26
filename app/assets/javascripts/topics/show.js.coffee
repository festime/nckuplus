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

  $('.create-comments').click ->
    inputTextId = $(@).data('target-id')
    $('#' + inputTextId).toggle()
    setTimeout (->
      try
        if $('#' + inputTextId).is(":visible")
          $('#' + inputTextId).find('.comment-body-form').focus()
      catch e
        console.log(e)
      return
    ), 100

  $('[id^="show-comments-of-post"]').click ->
    commentsId = $(@).attr('id').substring(5)
    $('#' + commentsId).toggle()
    $(@).children('.glyphicon-chevron-up').toggle()
    $(@).children('.glyphicon-chevron-down').toggle()

  $('.edit-comment').click ->
    commentBody = $(@).prev()
    commentBody.hide()

    commentForm = $(@).prevAll('.edit_comment')
    commentForm.show()
    commentForm.find('input[type=text]').focus()
    strLength = commentForm.find('input[type=text]').attr('value').length * 2
    commentForm.find('input[type=text]')[0].setSelectionRange(strLength, strLength)

    commentForm.focusout ->
      commentForm.hide()
      commentBody.show()

  return unless $(".topics.show").length > 0
  App.updateTimeFormat()

  idOfPosts = $('span')
    .filter ->
      return this.id.match(/post-[0-9]+$/)
    .map ->
      return $(@).attr("id").match(/[0-9]+/)

  idOfPosts.each (index, postId) ->
    App.updateTimeFormat('/posts/' + postId + '/comments')

