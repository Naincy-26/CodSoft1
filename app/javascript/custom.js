$(document).ready(function() {
    $('#search-form').on('submit', function(event) {
      event.preventDefault(); // Prevent the default form submission
      var form = $(this);
      var action = form.attr('action');
      
      // Make an AJAX request to fetch and replace content
      $.ajax({
        url: action,
        method: 'get', // Assuming it's a GET request, you can change it as needed
        data: form.serialize(), // Send form data
        success: function(response) {
          $('#main-content').html(response);
        },
        error: function() {
          console.error('Error in AJAX request');
        }
      });
    });
  });
  