window.App ||= {}

App.init = ->
  $('select').material_select()

  $('.title').hide()

  show = ->
    $('.title').show('slow')

  paw = $('.paw').drawsvg({duration: 2750, callback: show})

  paw.drawsvg "animate", -> show()

  animal = $('.animal-icon').drawsvg({duration: 2000})
  animal.drawsvg('animate')

$(document).on "page:change", ->
  App.init()
