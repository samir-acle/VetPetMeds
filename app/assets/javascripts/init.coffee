window.App ||= {}

App.init = ->
  $('select').material_select()

  paw = $('.paw').drawsvg({duration: 2750})
  paw.drawsvg('animate')
  animal = $('.animal-icon').drawsvg({duration: 2000})
  animal.drawsvg('animate')

$(document).on "page:change", ->
  App.init()
