$(document).ready(function() {
  return $('#phone_no').on('keyup focusout', function() {
    var phoneNumber, req;
    phoneNumber = $('#phone_no').val();
    if (phoneNumber.length > 7) {
      req = $.ajax({
        url: "/customers/find_by_phone/" + phoneNumber,

      });
      req.done(function(data) {
        $('#name').val(data);
        console.log(data);
      })
     	req.fail(function() {
       console.log("error");
       $('#name').removeAttr('disabled');
       $('#name').val("");
      })
    }
  })
})

