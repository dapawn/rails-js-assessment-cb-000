$(function(e){

  $("a.continue").on("click", function(e) {
    e.preventDefault(e);
    $.get(this.href).success(function(data) {
      $("div.main").html(data)
    });
  }); 

  $("#index_form").on("submit", function(e){
    e.preventDefault(e);
    // Low level
//    if (!e.handled) {
//      e.handled = true;
      $.ajax({
        type: ($("input[name='_method']").val() || this.method),
        url: this.action,
        data: $(this).serialize(), // either JSON or querystring serializing
        success: function(data){
          $("div.index").html(data)
          $("#index_form")[0].reset();  // after finished, clear entry from form
          $("#index_form").find("input[type=submit]").removeAttr('disabled'); //Once finished, we need to re-enable button
        }
      });
//    }
  });

});
