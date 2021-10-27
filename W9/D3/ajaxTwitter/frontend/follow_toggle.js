class FollowToggle {
  constructor(el) {
    this.$el = el; // $('.follow-toggle');
    this.userId = $el.data('user-id');
    this.followState = $el.data('follow-state');
    this.render();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.innerHTML = "Follow!";
    } else if (this.followState === "followed") {
      this.$el.innerHTML = "Unfollow!";
    }
  }

  handleClick() {
    this.preventDefault();
    if (this.followState === "unfollowed") {
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "post",
        dataType: 'JSON'
      })
      .then(response => {})
    }
  }
}

module.exports = FollowToggle;

// const saveGif = e => {
//   const $input = $('#save-gif-title');
//   const title = $input.val();
//   $input.val('');
// }

// const setEventListeners = () => {
//   $('#new-gif-form').on('submit', e => {
//     e.preventDefault();
//     // Fetch a new GIF
//     fetchNewGif();
//   });
// }