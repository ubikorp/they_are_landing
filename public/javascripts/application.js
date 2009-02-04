(function($) {
  $.fn.scrollUp = function(duration) {
    this.animate({ top : '-= 30px', opacity: '0' }, duration);
  }
 }) (jQuery);

$(document).ready(function() {
  $('ul.status li:first').addClass('selected');
  $(this).everyTime(6000, 'scroll', scrollTweets);
  $(this).everyTime(100000, 'update', updateTweets);

  function scrollTweets() {
    var prevStatus = $('ul.status li.selected');
    var nextStatus = prevStatus.next('li:first');

    if (nextStatus.length != 0) {
      prevStatus.removeClass('selected');
      nextStatus.addClass('selected');

      $('ul.status li:first').animate({
          marginTop: '-' + (parseInt($('ul.status li:first').height()) + 40) + 'px'
        }, 4000, "linear", function(){
          $(this).remove();
        }
      );
    }
  }

  function updateTweets() {
    $.get('http://' + document.location.host + '/random', function(data, textStatus) {
      $('ul.status').append(data);
    });
  }
});
