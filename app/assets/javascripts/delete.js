$(function(e){
  $("a.delete").one("click", function(e){
    e.preventDefault();
    e.stopPropagation();
    var $tr  = $(this).closest('tr');
console.log("In delete function");
    // Low level
console.log($("input[name='_method']").val() || this.method)
    $.ajax({
      type: "delete",
      url: this.href,
      data: $(this).serialize(), // either JSON or querystring serializing
      success: function(data){
console.log("In success function" +this);
        $tr.fadeOut();
      }
    });
  });
});
