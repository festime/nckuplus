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
  App.updateTimeFormat()

