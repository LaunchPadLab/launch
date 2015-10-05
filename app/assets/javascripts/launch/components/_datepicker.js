$(function(){

  $('.pickadate-datepicker').pickadate({
    formatSubmit: 'mm/dd/yyyy',
    hiddenSuffix: '',
    onOpen: function(){
      $("#ui-datepicker-div").hide();
    },
    onClose: function(){
      $(document.activeElement).blur()
      $("#ui-datepicker-div").hide();
    }
  })

});