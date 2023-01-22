document.addEventListener("turbo:load", function() {
  function initAutocomplete() {
    let inputs = document.getElementsByClassName('autocomplete')

    for (var i = 0; i < inputs.length; i++) {

      var autocomplete = new google.maps.places.Autocomplete(inputs[i],
        {
          types:['geocode'],
          componentRestrictions: {'country': ['es']},
          fields: ['name']
        }
      );
    }
  }
  google.maps.event.addDomListener(window, 'turbo:load', initAutocomplete);
})