$(document).ready(function(){
  $(".description_input").keyup(function(event){
    if(event.which == 32){
      $(this).next().focus();
      $(this).val($.trim($(this).val()));
    }
  });
  $(".description_input").keydown(function(event){
    if(event.which == 8 && this.value.length == 0){
      $(this).prev().focus();
      return false;
    }
  });
});
