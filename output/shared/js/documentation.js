$(function() {
  $('a[href*=#]').on('click', function(e) {
    if ($(e.target).hasClass('external')) {
      return;
    } else {
      e.preventDefault();
    }

    window.scrollTo(0, $(this.href.match(/(#.+)/)[0]).offset().top)
  });

  $('.toggler').on('click', function(e) {
    var $el = $(e.currentTarget),
        $target = $el.siblings('.response').toggle();
    if($el.data('open') || $el.data('open') == undefined) {
      $el.text('hide example');
      $el.data('open', false);
    } else {
      $el.text('view example');
      $el.data('open', true);
    }
  });
});
