require("jquery")


var MovieListFilter = {
    filter_adult: function () {
      // 'this' is *unwrapped* element that received event (checkbox)
      if ($(this).is(':checked')) {
        $('tr.adult').hide();
      } else {
        $('tr.adult').show();
      };
    },
    setup: function() {
      // construct checkbox with label
      var labelAndCheckbox =
        $('<br/>' + '<label for="filter">Only movies suitable for children</label>' +
          '<input type="checkbox" id="filter"/>' );
      labelAndCheckbox.insertBefore('#movies');
      $('#filter').on("click", MovieListFilter.filter_adult);
    }
  }
  
  $(MovieListFilter.setup);
    
 