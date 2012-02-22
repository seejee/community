// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require md_preview
//= require jquery.elastic
//= require cocoon
//= require save
//= require_tree '../../../vendor/assets/javascripts'
//= require_tree .

$(function(){
  $('a[rel~="twipsy"]').twipsy({live: true});
  $('a[rel~="twipsy"]').live('ajax:before', function(){
    $(this).twipsy('hide');
  });

  $('.bigtext').each(function() {
    var fontsize = parseInt($('.bigtext').css('font-size'));
    $(this).bigtext({maxfontsize: fontsize});
  });

  $('a.search-hover').click(function() {
    $('div#search-nav').fadeToggle(function() {
      $('.query').focus();
    });
    return false;
  });

  $('.close').click(function() {
    $('div#search-nav').fadeOut();
    return false;
  });

  //polyfill for placeholders in non-html5 browsers
  $('[placeholder]').focus(function() {
    var input = $(this);
    if (input.val() == input.attr('placeholder')) {
      input.val('');
      input.removeClass('placeholder');
    }
  }).blur(function() {
    var input = $(this);
    if (input.val() == '' || input.val() == input.attr('placeholder')) {
      input.addClass('placeholder');
      input.val(input.attr('placeholder'));
    }
  }).blur();
})

$('a[data-submit]').live('click', function(e){
  var form = $(this).attr('data-submit');
  $('#' + form).submit();

  $(this).attr('disabled', true);

  e.preventDefault();
});
