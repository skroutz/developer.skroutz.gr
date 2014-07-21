$(function() {

  // Handle links to headers
  $('a[href*=#]').on('click', function(e) {
    if ($(e.target).hasClass('external')) {
      return;
    } else {
      e.preventDefault();
    }

    window.scrollTo(0, $(this.href.match(/(#.+)/)[0]).offset().top)
  });

  // Make responses toggleable
  $('.toggler').on('click', function(e) {
    var $el = $(e.currentTarget),
        $target = $el.siblings('.response').toggle();
    if($el.data('open') || $el.data('open') == undefined) {
      $el.text('hide response');
      $el.data('open', false);
    } else {
      $el.text('view response');
      $el.data('open', true);
    }
  });

  // Highlight active sidebar item
  $('#js-sidebar')
    .find('a[href="./"]')
    .add('a[href="."]')
      .addClass('active')
});
