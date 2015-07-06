$(function () {
  $('.tabs--menu a').on('click', function  (e) {
      e.preventDefault();
      $(this).parent().addClass('is-active');
      $(this).parent().siblings().removeClass('is-active');

      var tab = $(this).attr('href');
      $('.tabs--content').not(tab).removeClass('is-active');
      $(tab).addClass('is-active');
  });
});