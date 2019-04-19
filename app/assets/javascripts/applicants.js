$(function(e){

  $("a.show_applicant").on("click", function(e){
    e.preventDefault(e);
    $.get(this.href).done(function(data) {
      $("body").html(data)
    });
  });

  $("#new_applicant").on("submit", function(e){
    e.preventDefault(e);

	alert("In form!")
    // Low level
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(), // either JSON or querystring serializing
      success: function(data){
        $("body").html(data)
      }
    });
  });

});
