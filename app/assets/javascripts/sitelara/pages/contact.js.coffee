Sitelara.Pages ?= {}
Sitelara.Pages.Contact =
  init: ->
    $('html,body').animate { scrollTop: $("#contato").offset().top }, 0
    console.log("VAMO TIME")
  modules: -> []