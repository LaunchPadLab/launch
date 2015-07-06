$(function() {

  var $topbar = $('.topbar');

  // Mobile Menu
  $(function(){
    $('.js-menu-trigger,.js-menu-screen').on('click touchstart',function(e) {
      e.preventDefault();
      $('.js-menu,.js-menu-screen').toggleClass('is-visible');
    });
  });

  // New Estimate Form Mobile
  $(function () {
    $('.new-estimate-trigger').on('click', function (e) {
      e.preventDefault();
      $('.new-estimate-trigger--icon').toggleClass('is-active');
      $(this).siblings('.card.card__is-hidden').toggleClass('card__is-active');
    });
  });

});