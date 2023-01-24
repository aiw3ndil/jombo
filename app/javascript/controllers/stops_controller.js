document.addEventListener("turbo:load", function() {
  $('#add-stop').click(function() {
    $('.stop-template').clone().appendTo('#stops-container')
  });
})