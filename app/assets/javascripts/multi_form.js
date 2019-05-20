$(function(e){

  $("a.continue").on("click", function(e) {
    e.preventDefault(e);
    $.get(this.href).success(function(data) {
      $("div.main").html(data)
    });
  }); 

  $("#index_form").on("submit", function(e){
    e.preventDefault(e);
	  console.log('In Multi-form3.');
    //$('#formModal').hide();
    //$('.modal-backdrop').remove();
	  //
    //$('div.modal').removeClass('in');
    //$('div.modal').attr("aria-hidden","true");
    //$('div.modal').css("display", "none");
    //$('div.modal-backdrop').remove();
    //$('body').removeClass('modal-open');

    //$('body').removeClass('modal-open');
    //$('div.modal').removeClass('show');
    //$('div.modal').removeAttr('aria-modal');
    //$('div.modal').css('padding-right', "");
    //$('div.modal').attr('aria-hidden', 'true');
    var review_url = this.action.replace(/\/\w+$/i, "");
    // Low level
      $.ajax({
        type: ($("input[name='_method']").val() || this.method),
        url: this.action,
        data: $(this).serialize(), // either JSON or querystring serializing
        success: function(data){
          if ($("div.index table").length ) {
	  console.log('In div.index table');
            $("div.index table").replaceWith(data);
          } else {
	  console.log('In div.main section');
            $("div.main").load(review_url);
          }
          if ( $("#index_form").length ) {
            $("#index_form")[0].reset();  // after finished, clear entry from form
            $("#index_form").find("input[type=submit]").removeAttr('disabled'); //Once finished, we need to re-enable button
          }

        }
      });
      $('button.closeModal').click();
  });

});
