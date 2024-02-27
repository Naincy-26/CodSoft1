import 'bootstrap/dist/js/bootstrap.bundle';

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
//= require bootstrap

$(document).ready(function() {
    // When the search button is clicked
    $('#search-form button[type="submit"]').on('click', function() {
      // Update the form action with the desired path
      var path = $(this).data('path');
      $('#search-form').attr('action', path);
    });
  });
  

  // jquery of hover
  // app/assets/javascripts/custom.js
$(document).ready(function() {
  $('.social-icon').hover(
    function() {
      // On hover, hide other icons
      $('.social-icon').not(this).addClass('hidden');
    },
    function() {
      // On hover out, show all icons
      $('.social-icon').removeClass('hidden');
    }
  );
});
//= require jquery3
//= require popper
//= require bootstrap
