$(function() {
  $('a[href*=#]').on('click', function(e) {
    e.preventDefault();
    $(this.href.match(/(#.+)/)[0]).animatedScroll({ duration: 'normal' })
  });
});
