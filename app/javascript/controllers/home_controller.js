document.addEventListener("turbo:load", function() {
  $('#user-menu-button').click(function() {
    $('#dropdown-user-menu').toggleClass('hidden')
  });
})