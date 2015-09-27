jQuery(document).ready ($) ->
  $(".scroll a, .navbar-brand, .gototop").click (event) ->
    event.preventDefault()
    $("html,body").animate
      scrollTop: $(@hash).offset().top
    , 600, "swing"
    $(".scroll li").removeClass "active"
    $(this).parents("li").toggleClass "active"

wow = new WOW(
  boxClass: "wowload" # animated element css class (default is wow)
  animateClass: "animated" # animation css class (default is animated)
  offset: 0 # distance to the element when triggering the animation (default is 0)
  mobile: true # trigger animations on mobile devices (default is true)
  live: true # act on asynchronously loaded content (default is true)
)
wow.init()

$(".carousel").swipe
  swipeLeft: ->
    $(this).carousel "next"
  swipeRight: ->
    $(this).carousel "prev"
  allowPageScroll: "vertical"
