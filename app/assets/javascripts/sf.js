$(function(e){
  $("div.main").on("click", "a.continue", function(e){
    e.preventDefault(e);
	  console.log("###In a.continue click");
    $.get(this.href).success(function(data) {
      $("div.main").html(data)
    });
  });

  $("div.main").on("click", "a.editAsset", function(e) {
	  console.log("###In a.editAsset click");
    //Set index class on the div so that the multi_form js script will work
    $('div.jsindex').removeClass('index');
    $(this).closest('div.jsindex').addClass('index');

    var description = $(this).data('description');
    var value = $(this).data('value');

    $("#asset_description").val(description);
    $("#asset_value").val(value);

    $.get(this.href).success(function(data) {
      $("div.modal-body").html(data)
    });
  });

  $("div.main").on("click", "a.editHouseholdMember", function(e) {
	  console.log("###In a.editHouseholdMember click");
    $('div.jsindex').removeClass('index');
    $(this).closest('div.jsindex').addClass('index');

    var name = $(this).data('name');
    var age = $(this).data('age');
    var relation = $(this).data('relation');

    $("#household_member_name").val(name);
    $("#household_member_age").val(age);
    $("#household_member_relation").val(relation);

    $.get(this.href).success(function(data) {
      $("div.modal-body").html(data)
    });
  });

  $("div.main").on("click", "a.editRequest", function(e) {
	  console.log("###In a.editRequest click");
    $('div.jsindex').removeClass('index');
    $(this).closest('div.jsindex').addClass('index');

    var item = $(this).data('item');
    var cost = $(this).data('cost');
    var availability = $(this).data('availability');
    var business = $(this).data('business');
    var benefit = $(this).data('benefit');
    var why = $(this).data('why');
    var recommendation = $(this).data('recommendation');

    $("#request_item").val(item);
    $("#request_cost").val(cost);
    $("#request_availability").val(availability);
    $("#request_business").val(business);
    $("#request_benefit").val(benefit);
    $("#request_why").val(why);
    $("#request_recommendation").val(recommendation);

    $.get(this.href).success(function(data) {
      $("div.modal-body").html(data)
    });
  });

  $("div.main").on("click", "a.delete", function(e){
    e.preventDefault();
    e.stopPropagation();
	  console.log("###In a.delete click");
    var $tr  = $(this).closest('tr');
    // Low level
    $.ajax({
      type: "delete",
      url: this.href,
      data: $(this).serialize(), // either JSON or querystring serializing
      success: function(data){
        $tr.fadeOut();
      }
    });
  });

  $("div.main").on("submit", "form#main_form", function(e){
    e.preventDefault(e);
	  console.log("###In form#main_form submit");
    // Low level
    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(), // either JSON or querystring serializing
      success: function(data){
        $("div.main").html(data);
      }
    });
  });

  $("div.main").on("submit", "#index_form", function(e){
    e.preventDefault(e);
	  console.log("###In #index_form submit");
    var review_url = this.action.replace(/\/\w+$/i, "");
    // Low level
      $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(), // either JSON or querystring serializing
        success: function(data){
          if ($("div.index table").length ) {
            $("div.index table").replaceWith(data);
          } else {
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
