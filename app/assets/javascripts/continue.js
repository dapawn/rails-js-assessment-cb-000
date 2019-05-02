$(function(e){

  $("a.continue").on("click", function(e) {
    e.preventDefault(e);
    $.get(this.href).success(function(data) {
      $("div.main").html(data)
    });
  });

});
