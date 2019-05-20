$(function(e){

  $("form#main_form").on("submit", function(e){
    e.preventDefault(e);
    // Low level
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(), // either JSON or querystring serializing
      success: function(data){
        $("div.main").html(data);
      }
    });
  });

});
