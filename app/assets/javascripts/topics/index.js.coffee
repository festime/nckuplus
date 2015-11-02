olderTopicsRequest = (e) ->
  if $(window).scrollTop() >= ($(document).height() - $(window).height())
    $(document).unbind('scroll')

    # numFixedTopics = $('.fixed-topics').length
    # numTopicsOnPage = $('[data-topic-id]').length - numFixedTopics
    numTopicsOnPage = $('[data-topic-id]').length

    $.ajax
      url: 'older_topics'
      method: 'POST'
      dataType: 'html'
      cache: false
      data: { number_topics_on_page: numTopicsOnPage }
      success: (html) ->
        if html.trim().length > 0
          $(document).scroll(olderTopicsRequest)

          html = html.replace(/(?:\r\n|\r|\n)/g, '')

          pageUpdater = require('pageupdater')
          objArr = $(html)
          $.map(objArr, (tr) ->
            pageUpdater.updateTimeFormat($(tr).find('.topic-last-reply-time'))
            $(tr).find('.topic-last-reply-time').data('changed', true)
          )
          $('tbody').append(objArr)

        else
          $('tbody').append("<tr><td colspan='6'>沒有更舊的貼文了~</td></tr>")

$(document).scroll(olderTopicsRequest)

$(document).on 'page:change', ->
  screenWidth = $('body').innerWidth()
  SMALL_SCREEN_WIDTH = 480

  if screenWidth < SMALL_SCREEN_WIDTH
    $('[data-topic-id]').each ->
      id = $(@).data('topic-id')
      title = $(@).find('.topic-title').html()
      category = $(@).find('.topic-category').html()
      visitorCount = $(@).find('.topic-visitor-count').html()
      username = $(@).find('.topic-user img').attr('alt')
      replyTime = $(@).find('.topic-last-reply-time').html()

      $('thead').remove()
      $(@).addClass('topic')
      newHTML = "
                  <td>
                    <div data-original-title='' title=''>
                      <div class='clearfix' data-original-title='' title=''>
                        <div class='pull-left topic-title' data-original-title='' title=''>
                          #{title}
                        </div>
                        <div class='topic-visitor-count pull-right' data-original-title='' title=''>
                          #{visitorCount}
                        </div>
                      </div>
                      <div class='topic-state clearfix' data-original-title='' title=''>
                        <div class='topic-category pull-left' data-original-title='' title=''>
                          <span data-original-title='' title=''>#{category}</span>
                        </div>
                        <div class='pull-right' data-original-title='' title=''>
                          <span class='topic-username' data-original-title='' title=''>#{username}</span>
                          <span class='topic-last-reply-time' data-original-title='' title='' id='topic-#{id}'>#{replyTime}</span>
                        </div>
                      </div>
                    </div>
                  </td>
      "
      $(@).html(newHTML)

  return unless $(".topics.index").length > 0
  pageUpdater = require('pageupdater')
  $('.topic-last-reply-time').each ->
    unless $(@).data('changed')?
      pageUpdater.updateTimeFormat($(@))
      $(@).data('changed', true)
    return

  # $('.topic-last-reply-time').one('load', ->
    # pageUpdater.updateTimeFormat($(@))
    # return
  # )

