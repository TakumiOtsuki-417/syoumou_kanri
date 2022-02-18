$(function() {
  $('.tab li').click(function() {
      var index = $('.tab li').index(this);
      $('.topicon > div').css('display','none');
      $('.topicon > div').eq(index).fadeIn("slow");
      $('.tab li').removeClass('select');
      $(this).addClass('select')
  });
});