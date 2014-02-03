$(function() {
  $('a[href*=#]').on('click', function(e) {
    if ($(e.target).hasClass('external')) {
      return;
    } else {
      e.preventDefault();
    }

    window.scrollTo(0, $(this.href.match(/(#.+)/)[0]).offset().top)
  });
});
