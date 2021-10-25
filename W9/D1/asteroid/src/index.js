console.log("Webpack is working!");

const Asteroid = require("./asteroid.js");
const MovingObject = require("./moving_object.js");
document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext('2d');
  const test = new Asteroid([60, 60]);
  window.test = test;
  window.ctx = ctx;
  window.yes = true
  
})
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
