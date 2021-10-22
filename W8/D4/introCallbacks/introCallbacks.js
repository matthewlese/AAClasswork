class Clock {
  constructor() {
    const startTime = new Date();
    this.hours = startTime.getHours();
    this.minutes = startTime.getMinutes();
    this.seconds = startTime.getSeconds();
    this.printTime();
    let boundFunc = this._tick.bind(this);
    setTimeout(boundFunc, 1000);
    // setTimeout(this._tick, 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.minutes += 1;
      this.seconds = 0;
    }
    if (this.minutes === 60) {
      this.hours += 1;
      this.minutes = 0;
    }
    this.printTime(this.hours, this.minutes, this.seconds);
    setTimeout(this._tick.bind(this), 1000);
  }
}

// const clock = new Clock();
// const readline = require('readline');
// reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0 ) {
    const response = reader.question('insert a number', answer => {
      let newNum = parseInt(answer); // like in Ruby: '8'.to_i # returns 8
      sum += newNum;
      --numsLeft;
      console.log(sum);
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }
}

// addNumbers(5, 5, sum => console.log(`Total Sum: ${sum}`));



const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.

  const response = reader.question('Is el1 greater than el2?', answer => {
    if (answer === 'true'){
      callback(true);
    } else {
      callback(false);
    }
    reader.close();
  })
}
// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.

  if (i < arr.length - 1){
    askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
      if (isGreaterThan){
        let temp = arr[i];
        arr[i] = arr[i + 1]; //[a[0], a[1]] = [a[1], a[0]]
        arr[i + 1] = temp;
        madeAnySwaps = true
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
      }
    });
  } else if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps)
  }
} 

let outerBubbleSortLoop = function () {
  console.log('OUTERBUBBLESORT')
}
let arr = [2,3,1,6,5,4]
innerBubbleSortLoop(arr, 0, true, outerBubbleSortLoop)
// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});