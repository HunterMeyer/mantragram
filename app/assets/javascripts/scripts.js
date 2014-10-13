$(document).ready(function() {

  $('.mini-color input[type=text]').minicolors();

  $('.show-form').click(function() {
    $(this).next('.row').toggleClass('hidden');
  });

  $('.cancel-form').click(function() {
    $(this).parent().parent().parent('.row').toggleClass('hidden');
  });

  $('.send-now').click(function() {
    $(this).children('i').toggleClass('hidden');
  });

  // Live updating stylesheet
  var navbar =          $('#style_navbar');
  var bg =              $('#style_background');
  var heading =         $('#style_heading');
  var card_bg =         $('#style_card_background');
  var mant_title =      $('#style_card_title');
  var mant_send =       $('#style_send_mantra');
  var mant_delete =     $('#style_delete_mantra');
  var button =          $('#style_create_button');

  navbar.change(function()          { $('.navbar-default').css('background', $(this).val()) });
  bg.change(function()              { $('body').css('background', $(this).val()) });
  heading.change(function()         { $('h4').css('color', $(this).val()) });
  card_bg.change(function()         { $('.outer').css('background', $(this).val()) });
  mant_title.change(function()      { $('.best_in_place').css('color', $(this).val()) });
  mant_send.change(function()       { $('.send-now').css('color', $(this).val()) });
  mant_delete.change(function()     { $('.erase').css('color', $(this).val()) });
  button.change(function()          { $('#create-mantra').attr('class', 'btn btn-' + $(this).find(':selected').val()) });

});

