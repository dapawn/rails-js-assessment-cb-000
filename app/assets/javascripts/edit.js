$(function(e){
  $("a.edit").on("click", function(e) {
//    e.preventDefault(e);
    var description = $(this).data('description');
    var value = $(this).data('value');

    $("#asset_description").val(description);
    $("#asset_value").val(value);

    $.get(this.href).success(function(data) {
      $("div.modal-body").html(data)
    });

  });
});
