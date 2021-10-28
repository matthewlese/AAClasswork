const FollowToggle = require("./follow_toggle");
// require(FollowToggle)

$(() => {
  const buttons = $('button.follow-toggle'); //jQuery collection
  
  buttons.each((i, button) => { //gives index, html ele
    let newButton = new FollowToggle($(button)); // 

    const setEventListeners = () => {
      $('.follow-toggle').on('submit', e => {
        e.preventDefault();
        newButton.handleClick();
      })
    }
    $(setEventListeners);
  })


})

