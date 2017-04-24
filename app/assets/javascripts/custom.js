$(document).ready(function(){
  var charMax = 140;

  function limitWordCount(summary, limit) {
    var counter = $("#word-count");
    var txt = $(summary).val();
    var summaryLength = txt.length;

    // check if the current length is over the limit
    if(summaryLength > limit){
      $(summary).val(txt.substr(0,limit));
      $(counter).html(charMax - (summaryLength-1) + " characters");
    }
    else {
      $(counter).html(charMax - summaryLength + " characters");
    }

    // check if user has less than 20 chars left
    if(limit - summaryLength <= 20) {
      $(counter).addClass("warning");
    } else {
      $(counter).removeClass("warning");
    }
  }

  $("#study-summary").keyup(function(){
    limitWordCount($(this), charMax);
  });
});

