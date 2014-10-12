$(document).ready(function() {

  $('.mini-color input[type=text]').minicolors();

  $('.show-form').click(function() {
    $(this).next('.row').toggleClass('hidden');
  });

  $('.cancel-form').click(function() {
    $(this).parent().parent().parent('.row').toggleClass('hidden');
  });

});