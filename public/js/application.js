$(document).ready(function() {
  startClock();
  keyPress();
  $('button').click(resetGame);
});

function keyPress() {
  $(document).keyup(function(event) {
    if (event.keyCode == 80) {
      gamePlay(1)
    } else if (event.keyCode == 81) {
      gamePlay(2)
    } else if (event.keyCode == 82) {
      gamePlay(3)
    } else if (event.keyCode == 83) {
      gamePlay(4)
    };
  });
}

function startClock() {
  $(document).one('keydown', function(event) {
    start = event.timeStamp;
  });
}

function gamePlay(player) {
  var current = $('table tr#player_'+player+' td.active')
  if (current.hasClass('finish')) {
    winner(player, start);
  } else {
    advancePlayer(current);
  };
};

function advancePlayer (current) {
  current.next().addClass('active');
  current.removeClass('active');
};

function winner(player, start) {
  var player_name = $("#p" + player + " .java_player").text();
  finish = (event.timeStamp - start) / 1000;
  alert(player_name + ' wins with a time of '+finish+' seconds!');
  sendResults(player_name);
}

function resetGame() {
  $('table#track td').removeClass('active');
  $('table#track tr td:first-child').addClass('active');
};

function buildForm() {
  $('.container').append('<form action="' + window.location + '" method="post" id="race_results"></form>');
  $('form#race_results').append('<input type="hidden" name="winner" value="">')
    .append('<input type="hidden" name="result_time" value="">')
}

function sendResults(player) {
  buildForm();
  $('#race_results input[name=winner]').val(player);
  $('#race_results input[name=result_time]').val(finish);
  $('#race_results').submit();
};
