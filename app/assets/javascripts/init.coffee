window.App ||= {}

App.init = ->
  # initializes select boxes
  $('select').material_select()

  # animation on home index page
  $('.title').hide()
  
  show = ->
    $('.title').show('slow')

  paw = $('.paw').drawsvg({duration: 2750, callback: show})
  paw.drawsvg "animate", -> show()

  # animation on animals index page
  animal = $('.animal-icon').drawsvg({duration: 2000})
  animal.drawsvg('animate')

  # makes labels on edit form appear above the input field
  $('.animals.edit label').addClass('active')

$(document).on "page:change", ->
  App.init()
