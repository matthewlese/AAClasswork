const MovingObject = require("./moving_object");
const Util = require("./utils");
Util.inherits(Asteroid, MovingObject);

function Asteroid(pos) {
  options = {
    pos: pos,
    vel: Util.randomVec(1),
    color: "#808080",
    radius: 8
  };
  MovingObject.call(this, options);
}

module.exports = Asteroid;
// const test = new Asteroid([60, 60]);
// window.test = test;
// console.log(test);