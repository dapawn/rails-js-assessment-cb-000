$(function(e){
  $("div.main").on("click", "a.editAsset", function(e) {
	  console.log("In a.editAsset");
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
});

$(function(e){
  $("div.main").on("click", "a.editHouseholdMember", function(e) {
	  console.log("In a.editHouseholdMembers");
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
});

$(function(e){
  $("div.main").on("click", "a.editRequest", function(e) {
	  console.log("In a.editRequest");
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
});

