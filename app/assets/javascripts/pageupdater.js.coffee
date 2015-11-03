pageUpdater = 
  updateTimeFormat: (obj) ->
    unless obj.data('changed')?
      obj.html(moment(obj.html().trim()).fromNow())
      obj.data('changed', true)

  topicListInSmallScreen: ->
    screenWidth = $('body').innerWidth()
    SMALL_SCREEN_WIDTH = 480

    if screenWidth < SMALL_SCREEN_WIDTH
      $("tr[data-topic-id]").not(".topic").each ->
        id = $(@).data('topic-id')
        title = $(@).find('.topic-title').html()
        category = $(@).find('.topic-category').html() || ''
        visitorCount = $(@).find('.topic-visitor-count').html()
        username = $(@).find('.topic-user img').attr('alt')
        replyTime = $(@).find('.topic-last-reply-time').html()

        $('thead').remove()
        $(@).addClass('topic')
        newHTML = "
                    <td>
                      <div class='pull-left'>
                        #{$(@).find('.topic-user').html()}
                      </div>
                      <div class='topic-item'>
                        <div class='clearfix'>
                          <div class='pull-left topic-title'>
                            #{title}
                          </div>
                          <div class='topic-visitor-count pull-right'>
                            #{visitorCount}
                          </div>
                        </div>
                        <div class='topic-state clearfix'>
                          <div class='topic-category pull-left'>
                            <span>#{category}</span>
                          </div>
                          <div class='pull-right'>
                            <span class='topic-last-reply-time' id='topic-#{id}'>#{replyTime}</span>
                          </div>
                        </div>
                      </div>
                    </td>
        "
        $(@).html(newHTML)
module.exports = pageUpdater

