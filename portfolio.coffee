# !Initialize
easing = "easeInOutCubic"
highest_page = 0

trans = (func) ->
    off_left = $("#content .page.off-left").add("#navigation .menu-item.off-left")
    previous = $("#content .page.previous").add("#navigation .menu-item.previous")
    active = $("#content .page.active").add("#navigation .menu-item.active")
    next = $("#content .page.next").add("#navigation .menu-item.next")
    off_right = $("#content .page.off-right").add("#navigation .menu-item.off-right")
    func off_left, previous, active, next, off_right

$(document).ready ->

  $(".page.active").find(".page-number").show()

  $("body").on "click", ".off-left", (event) ->
    event.stopPropagation()
    unless $(this).is(":animated")
        trans (off_left, previous, active, next, off_right) ->
            active.removeClass("active").addClass("off-right")
            previous.removeClass("previous").addClass("next")
            off_left.removeClass("off-left").addClass("active")
    false

  $("body").on "click", ".previous", (event) ->
    event.stopPropagation()
    unless $(this).is(":animated")
        trans (off_left, previous, active, next, off_right) ->
            next.removeClass("next").addClass("off-right")
            active.removeClass("active").addClass("next")
            previous.removeClass("previous").addClass("active")
            off_left.removeClass("off-left").addClass("previous")
    false

  $("body").on "click", ".next", (event) ->
    event.stopPropagation()
    unless $(this).is(":animated")
        trans (off_left, previous, active, next, off_right) ->
            previous.removeClass("previous").addClass("off-left")
            active.removeClass("active").addClass("previous")
            next.removeClass("next").addClass("active")
            off_right.removeClass("off-right").addClass("next")
    false

  $("body").on "click", ".off-right", (event) ->
    event.stopPropagation()
    unless $(this).is(":animated")
        trans (off_left, previous, active, next, off_right) ->
            active.removeClass("active").addClass("off-left")
            next.removeClass("next").addClass("previous")
            off_right.removeClass("off-right").addClass("active")
    false

  $(".carousel").owlCarousel
      navigation: true,
      navigationText: ["&larr;", "&rarr;"]
      slideSpeed: 300,
      paginationSpeed: 400,
      singleItem: true,
      autoHeight: false,
