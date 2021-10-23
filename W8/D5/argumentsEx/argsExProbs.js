// function sum() {
//   let args = Array.from(arguments);
//   return args.reduce((acc, ele) => acc + ele);
// }

// function sum(...args) {
//   return args.reduce((acc, ele) => acc + ele);
// }

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

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, ele) => acc + ele);
    } else {
      return _curriedSum
    }
  }
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56


// Function.prototype.curry = function (ctx, numArgs) {
//   let fnc = this;
//   let numbers = [];
//   return function _curry (...nums) {
//     numbers = numbers.concat(nums);
//     if (numbers.length === numArgs) {
//       return fnc.apply(ctx, numbers)
//       // return numbers.reduce((acc, ele) => acc + ele);
//     } else {
//       return _curry;
//     }
//   };
// };


Function.prototype.curry = function (numArgs, ...nums) {
  // let that = this;
  let fnc = this;
  let numbers = nums;
  return function _curry(...nums) {
    numbers = numbers.concat(nums);
    if (numbers.length === numArgs) {
      return fnc.apply(this, numbers)
      // return numbers.reduce((acc, ele) => acc + ele);
    } else {
      return _curry;
    }
  };
};

// console.log(sumThree.curry(this, 3) (4,20,6));
// console.log(sumThree.curry(this, 3,4,20,6)());
// console.log(sumThree.curry(this, 3,4)(20,6));
console.log(sumThree.curry(3)(4,20)(6));

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30