$(function() {

  $('.image_select').bind("change", function(event){
    var selectedFile = event.target.files[0];
    var reader = new FileReader();

    reader.onload = function(event) {
      $('.image_display').attr('src', event.target.result);
    };

    reader.readAsDataURL(selectedFile);
  });

});
