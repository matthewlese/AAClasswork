// function sum() {
//   let args = Array.from(arguments);
//   return args.reduce((acc, ele) => acc + ele);
// }

function sum(...args) {
  return args.reduce((acc, ele) => acc + ele);
}

// console.log(sum(1, 2, 3, 4, 5));



class Cat {
  constructor(name) {
    this.name = name;
  }
  
  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");


// Function.prototype.myBind = function (ctx) {
//   let fnc = this;
//   let bindArgs = Array.from(arguments).slice(1);
//   return function () {
//     let callArgs = Array.from(arguments);
//     let allArgs = bindArgs.concat(callArgs);
//     return fnc.apply(ctx, allArgs);
//   };
// };


// const myBind = function (ctx, ...rest) {  // TypeError: markov.says.myBind is not a function
// function myBind(ctx, ...rest) { // TypeError: markov.says.myBind is not a function
Function.prototype.myBind = function (ctx, ...rest) {
  let fnc = this;
  // let bindArgs = [...rest];
  let bindArgs = rest;
  return function (...rest2) {
    // let callArgs = [...rest2];
    let callArgs = rest2;
    let allArgs = bindArgs.concat(callArgs);
    return fnc.apply(ctx, allArgs);
  };
};


// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true