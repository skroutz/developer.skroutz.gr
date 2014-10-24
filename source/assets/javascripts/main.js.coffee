###
  UI
###
UI = {}
UI._fadeDuration = 250
UI._scrollDuration = 350
UI._scrollTopOffset = 100
UI._navbarTrans = true
UI._navbarTransClass = 'trans'
UI._tableResponsiveWrapper = '<div class="table-responsive"></div>'

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
      e.preventDefault()

      if $(@).scrollTop() > UI._scrollTopOffset
        UI.Navbar.transparent($domElement)
      else
        UI.Navbar.solid($domElement)

###
  UI.Anchor
###
UI.Anchor =
  scrollToTarget: (target) ->
    $('html, body').animate { scrollTop: $(target).offset().top - 60 },
      @_scrollDuration, -> window.location.hash = target

  bindListeners: ($domElement) ->
    $domElement.on 'click.ui.Anchor', (e) ->
      e.preventDefault()
      UI.Anchor.scrollToTarget($(@).attr('href'))

###
  UI.Permalink
###
UI.Permalink =
  bindListeners: ($domElement) ->
    $domElement
      .one 'mouseover.ui.Permalink', (e) =>
        $target  = $(e.currentTarget)
        fragment = $target.attr('id')

        if $target.find('a.permalink').length is 0 and fragment
          $target.append($(@_link_template(fragment)))
      .on 'click.ui.Permalink', '.permalink', (e) ->
         e.preventDefault()
         UI.Anchor.scrollToTarget @hash

  _link_template: (id) -> '<a href="#' + id + '" class="permalink"></a>'

###
  UI.BackToTop
###
UI.BackToTop =
  show: ($domElement) ->
    $domElement.fadeIn(@_fadeDuration, -> $(window).trigger('shown.ui.backToTop'))

  hide: ($domElement) ->
    $domElement.fadeOut(@_fadeDuration, -> $(window).trigger('hidden.ui.backToTop'))

  scrollToTop: ->
    $('html, body').animate { scrollTop: 0 }, @_scrollDuration, ->
      window.location.hash = ''

  bindListeners: ($domElement) ->
    $domElement.on 'click.ui.backToTop', (e) ->
      e.preventDefault()
      UI.BackToTop.scrollToTop()

    $(window).on 'scroll.ui.backToTop', (e) ->
      e.preventDefault()

      if $(@).scrollTop() > UI._scrollTopOffset
        UI.BackToTop.show($domElement)
      else
        UI.BackToTop.hide($domElement)

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
    $domElement.on 'click.ui.offCanvas', (e) ->
      e.preventDefault()
      UI.OffCanvas.toggleSideBar()

    $('[data-ui-scope="offCanvasOverlay"]').on 'click.ui.offCanvasOverlay',
      (e) ->
        e.preventDefault()
        UI.OffCanvas.toggleSideBar()

###
  UI.CodeExample
###
UI.CodeExample =
  toggleResponse: ($toggler) ->
    $response = $toggler.siblings('.response')

    if $toggler.is('.active')
      $response.slideUp()
      $toggler.removeClass('active').text('View Response')
    else
      $response.slideDown()
      $toggler.addClass('active').text('Hide Response')

  bindListeners: ($domElement) ->
    $domElement.on 'click.ui.codeExample', (e) ->
      e.preventDefault()
      UI.CodeExample.toggleResponse($(@))

###
  UI.ResponseHeaders
###
class UI.ResponseHeaders
  ACTIVE_CLASS = 'active'
  HIDDEN_CLASS = 'hidden'

  constructor: (el) ->
    @$el = $(el)
    @bindListeners()

  bindListeners: ->
    @$el.on 'click.ui.ResponseHeaders', @toggleHeader

  toggleHeader: (e) ->
    $el = $(e.currentTarget)
    $headers = $($el.data('target'))

    if $headers.hasClass(HIDDEN_CLASS)
      $el.text($el.data('hideText'))
    else
      $el.text($el.data('showText'))

    $el.toggleClass(ACTIVE_CLASS)
    $headers.toggleClass(HIDDEN_CLASS)

###
  UI.Table
###
UI.Table =
  addResponsiveWrapper: ->
    $('#main table').wrap(UI._tableResponsiveWrapper)

###
  DOM Ready
###
((window, document, $) ->
  $ ->
    UI.Navbar.bindListeners $('[data-ui-scope="navbar"]')
    UI.Anchor.bindListeners $('#main a[href^=#]')
    UI.Permalink.bindListeners $('#main').find('h2, h3, h4')
    UI.BackToTop.bindListeners $('[data-ui-scope="backToTop"]')
    UI.OffCanvas.bindListeners $('[data-ui-scope="offCanvasBtn"]')
    UI.CodeExample.bindListeners $('.example').find('.toggler')
    new UI.ResponseHeaders('.http-headers-toggler')
    UI.Table.addResponsiveWrapper()

)(window, document, jQuery)
