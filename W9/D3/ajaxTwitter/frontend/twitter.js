const FollowToggle = require("./follow_toggle");

require(FollowToggle)

$(() => alert('DOM is fully loaded'))
// $(document).ready(() => alert('DOM is fully loaded'))

const buttons = $('button.follow-toggle');

buttons.each( button => {
  new FollowToggle(button); // do we need to save?
})