$(document).ready(function() {
  $('.best_in_place').best_in_place();

  $('#change-password').click(function() {
    $('#edit-password-form').show();
  });

  $('#cancel-password').click(function() {
    $('#edit-password-form').hide();
  })



});