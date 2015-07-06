// Slider accordion
$(function() {
  $('.accordion-link a').on('click', function(e) {
    e.preventDefault();
    var dataAttr = $(this).data('type'),
        $accordionLink = $('.accordion-link'),
        $accordionContainer = $('.accordion-items--container'),
        $accordionItem = $('.accordion-item');

    $accordionLink.removeClass('is-active-link');
    $(this).parent().addClass('is-active-link');

    $accordionContainer.find('.accordion-item:not([data-type="' + dataAttr + '"])').hide().removeClass('is-active');
    $accordionContainer.find('.accordion-item[data-type="' + dataAttr + '"]').show().addClass('is-active');
  });
});

$(document).ready(function() {
  $('.accordion-items--container').find('.accordion-item[data-type="trips"]').show();
});


// Dropdown accordion
$('.toggle--trigger').bind('click', function(e){
  e.preventDefault();
  $(this).find('li').toggleClass('is-expanded');
  $(this).find('.toggle--content').addClass('is-expanded').slideToggle();
});