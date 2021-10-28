/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
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


})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map