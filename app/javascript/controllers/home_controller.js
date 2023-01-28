document.addEventListener("turbo:load", function() {
  $('#user-menu-button').click(function() {
    $('#dropdown-user-menu').toggleClass('hidden')
  });

  $('#mobile-menu').click(function() {
    $('#mobile-menu-items').toggleClass('hidden')
  });
})
