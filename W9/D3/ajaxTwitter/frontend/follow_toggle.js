class FollowToggle {
  constructor(el) {
    this.$el = el; // $('.follow-toggle');
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    }
  }

  handleClick() {
    this.preventDefault();
    debugger;
    if (this.followState === "unfollowed") {
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "post",
        dataType: 'JSON'
      })
      .then(response => {
        this.followState = "followed"
        this.render()
      })
    } else {
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "delete",
        dataType: 'JSON'
      })
      .then(response => {
        this.followState = "unfollowed"
        this.render()
      })
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