$(document).ready(function() {
  $('#add-event').click(function(event) {
    var newRow = $('.event.template').children().clone();
    $('#maintenance_events').append(newRow);
    event.preventDefault();
  });

  $(".delete-event").live('click', function(event) {
    var container = $(this).closest("li");
    container.remove();
    event.preventDefault();
  });
});