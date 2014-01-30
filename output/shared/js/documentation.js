$(function() {
  $('a[href*=#]').on('click', function(e) {
    e.preventDefault();
    window.scrollTo(0, $(this.href.match(/(#.+)/)[0]).offset().top)
  });
});
