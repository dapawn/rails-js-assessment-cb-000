$(function(e){
  $("a.show_applicant").on("click", function(e){
    e.preventDefault(e);
	  alert("Hey!")
    $.get(this.href).done(function(data) {
      $("body").html(data)
    });
  });
});
