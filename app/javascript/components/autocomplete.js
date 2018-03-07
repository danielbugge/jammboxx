function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var jammAddress = document.getElementById('jamm_address');

    if (jammAddress) {
      var autocomplete = new google.maps.places.Autocomplete(jammAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(jammAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };





