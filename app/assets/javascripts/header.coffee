$.fn.animateRotate = (angle, duration, easing, complete) ->
  @each ->
    $elem = $(this)
    $(deg: 0).animate { deg: angle },
      duration: duration
      easing: easing
      step: (now) ->
        $elem.css transform: 'rotate(' + now + 'deg)'
        return
      complete: complete or $.noop
    return

$(document).on 'page:change', ->
  showMenu = $('#show-menu')
  hideMenu = $('#hide-menu')

  showMenu.click ->
    showMenu.animateRotate(-180, 200)
    showMenu.fadeToggle(200)
    hideMenu.animateRotate(-360, 200)
    hideMenu.fadeToggle(100)
    $('#sidebar').animate({"margin-right": '+=268'})
    # showMenu.animateRotate(-180, 300)
    # showMenu.fadeToggle(300)
    # hideMenu.animateRotate(-360, 300)
    # hideMenu.fadeToggle(100)
    # $('#sidebar').animate({"margin-right": '+=268'})
  hideMenu.click ->
    hideMenu.animateRotate(180, 200)
    hideMenu.fadeToggle(200)
    showMenu.animateRotate(180, 200)
    showMenu.fadeToggle(100)
    $('#sidebar').animate({"margin-right": '-=268'})
    # hideMenu.animateRotate(180, 300)
    # hideMenu.fadeToggle(300)
    # showMenu.animateRotate(180, 300)
    # showMenu.fadeToggle(100)
    # $('#sidebar').animate({"margin-right": '-=268'})
