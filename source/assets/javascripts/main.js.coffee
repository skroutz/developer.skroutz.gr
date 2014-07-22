###########################
# Console Protection
###########################
window.console = { log: -> {} } if window.console is 'undefined'


###########################
# UI
###########################
UI = {}
UI._fadeDuration = 250
UI._scrollDuration = 350
UI._scrollTopOffset = 100
UI._navbarTrans = true
UI._navbarTransClass = 'trans'

###
  UI.Navbar
###
UI.Navbar =
  solid: ($domElement) ->
    $domElement.removeClass UI._navbarTransClass
  transparent: ($domElement) ->
    $domElement.addClass UI._navbarTransClass
  bindListeners: ($domElement) ->
    $(window).on 'scroll.ui.transparentizeNavbar', (e) ->
      if $(@).scrollTop() > UI._scrollTopOffset then UI.Navbar.transparent($domElement) else UI.Navbar.solid($domElement)

###
  UI.BackToTop
###
UI.BackToTop =
  show: ($domElement) ->
    $domElement.fadeIn(@_fadeDuration, -> $(window).trigger('shown.ui.backToTop'))
  hide: ($domElement) ->
    $domElement.fadeOut(@_fadeDuration, -> $(window).trigger('hidden.ui.backToTop'))
  scrollToTop: ->
    $('html, body').animate { scrollTop: 0 }, @_scrollDuration
  bindListeners: ($domElement) ->
    $domElement.on 'click.ui.backToTop', (e) -> UI.BackToTop.scrollToTop()
    $(window).on 'scroll.ui.backToTop', (e) ->
      if $(@).scrollTop() > UI._scrollTopOffset then UI.BackToTop.show($domElement) else UI.BackToTop.hide($domElement)

###
  UI.OffCanvas
###
UI.OffCanvas =
  toggleSideBar: ->
    cl = 'in'
    no_overflow = 'no-overflow'
    $body = $('body')
    $sidebar = $('[data-ui-scope="offCanvas"]')
    $overlay = $('[data-ui-scope="offCanvasOverlay"]')
    $swiftype = $('[data-ui-scope="swiftypeSearch"]')
    $swiftype_navbar = $('[data-ui-scope="swiftypeNavbar"]')
    $swiftype_sidebar = $('[data-ui-scope="swiftypeSidebar"]')

    if $sidebar.is(".#{cl}")
      $swiftype.detach().appendTo($swiftype_navbar)
      $body.removeClass(no_overflow)
      $sidebar.removeClass(cl)
      $overlay
        .fadeOut(UI._fadeDuration)
        .removeClass('overlay overlay-offcanvas')
    else
      $swiftype.detach().appendTo($swiftype_sidebar)
      $body.addClass(no_overflow)
      $sidebar.addClass(cl)
      $overlay
        .fadeIn(UI._fadeDuration)
        .addClass('overlay overlay-offcanvas')
        .removeClass('hidden')
  bindListeners: ($domElement) ->
    $domElement.on 'click.ui.offCanvas', (e) -> UI.OffCanvas.toggleSideBar()
    $('[data-ui-scope="offCanvasOverlay"]').on 'click.ui.offCanvasOverlay',
    (e) -> UI.OffCanvas.toggleSideBar()


###########################
# DOM Ready
###########################
((window, document, $)->

  $(document)
    .ready (e) ->
      UI.Navbar.bindListeners $('[data-ui-scope="navbar"]')
      UI.BackToTop.bindListeners $('[data-ui-scope="backToTop"]')
      UI.OffCanvas.bindListeners $('[data-ui-scope="offCanvasBtn"]')
    .on 'click.pseudoLink', 'a[href="#"], a.pseudo', (e) ->
      e.preventDefault()

  $(window).on 'resize', (e) ->
    #console.log '[window resize]'

)(window, document, jQuery)
