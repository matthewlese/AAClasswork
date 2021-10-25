/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\r\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\r\nUtil.inherits(Asteroid, MovingObject);\r\n\r\nfunction Asteroid(pos) {\r\n  options = {\r\n    pos: pos,\r\n    vel: Util.randomVec(1),\r\n    color: \"#808080\",\r\n    radius: 8\r\n  };\r\n  MovingObject.call(this, options);\r\n}\r\n\r\nmodule.exports = Asteroid;\r\nconst test = new Asteroid([60, 60]);\r\nwindow.test = test;\r\nconsole.log(test);\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\");\r\n\r\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\ndocument.addEventListener(\"DOMContentLoaded\", function(){\r\n  const canvas = document.getElementById('game-canvas');\r\n  const ctx = canvas.getContext('2d');\r\n  const test = new Asteroid([60, 60]);\r\n  window.test = test;\r\n  window.ctx = ctx;\r\n  window.yes = true\r\n\r\n})\r\nwindow.MovingObject = MovingObject;\r\nwindow.Asteroid = Asteroid;\r\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\r\n  this.pos = options[\"pos\"];\r\n  this.vel = options[\"vel\"];\r\n  this.radius = options[\"radius\"];\r\n  this.color = options[\"color\"];\r\n}\r\n\r\nMovingObject.prototype.draw = function(ctx){\r\n  ctx.fillStyle = this.color;\r\n  ctx.beginPath();\r\n  ctx.arc(\r\n    this.pos[0],\r\n    this.pos[1],\r\n    this.radius,\r\n    0,\r\n    2 * Math.PI,\r\n    false\r\n  )\r\n  ctx.fill();\r\n}\r\n\r\nMovingObject.prototype.move = function(ctx) {\r\n  this.pos[0] += this.vel[0];\r\n  this.pos[1] += this.vel[1];\r\n  // this.draw(ctx);\r\n}\r\n\r\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\r\n  inherits(childClass, parentClass) {\r\n    function Surrogate() {};\r\n    Surrogate.prototype = parentClass.prototype;\r\n    childClass.prototype = new Surrogate();\r\n    childClass.prototype.constructor = childClass;\r\n  },\r\n  // Return a randomly oriented vector with the given length.\r\n  randomVec(length) {\r\n    const deg = 2 * Math.PI * Math.random();\r\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\r\n  },\r\n  // Scale the length of a vector by the given amount.\r\n  scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n  }\r\n};\r\n\r\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;