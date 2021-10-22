// function sum() {
//   let args = Array.from(arguments);
//   return args.reduce((acc, ele) => acc + ele);
// }

function sum(...args) {
  return args.reduce((acc, ele) => acc + ele);
}

// console.log(sum(1, 2, 3, 4, 5));

