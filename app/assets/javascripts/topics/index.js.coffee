$(document).on 'page:change', ->
  return unless $(".topics.index").length > 0
  pageUpdater = require('pageupdater')

  config = {
    attributes: true
    childList: true
    characterData: true
    subtree: true
    attributeOldValue: true
    characterDataOldValue: true
    # attributeFilter: true
  }
 
  table = document.querySelector('table')
  observer = new MutationObserver (mutations) ->
    mutations.forEach (mutation) ->
      # console.log(mutation.type)
      if mutation.type == 'childList'
        pageUpdater.topicListInSmallScreen()

  observer.observe(table, config)
  # observer.disconnect();

  pageUpdater.topicListInSmallScreen()

  $('.topic-last-reply-time').each ->
    pageUpdater.updateTimeFormat($(@))
    return

  olderTopicsRequest = (e) ->
    if $(window).scrollTop() >= ($(document).height() - $(window).height())
      $(document).unbind('scroll')

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

