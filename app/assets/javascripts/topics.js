//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

function changeTimeFormatOfPost(id, index, arrayOfId) {
  var target = $('#topic-' + id);
  target.html(moment(target.html()).fromNow());
}

$(document).ready(function() {
  $.ajax({
    url:  "/topics",
    dataType: "json",
    data: {},
    success: function(data) {
      data.toString().split(",").forEach(changeTimeFormatOfPost);
    }
  });
});
