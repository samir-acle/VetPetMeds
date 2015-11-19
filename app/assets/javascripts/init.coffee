window.App ||= {}

App.init = ->
  $('select').material_select()

$(document).on "page:change", ->
  App.init()
