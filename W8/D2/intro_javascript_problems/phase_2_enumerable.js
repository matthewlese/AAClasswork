//myeach
Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}


let arr = [1, 2, 3, 4, 5];
// console.log(arr.myEach(callback));

Array.prototype.myMap = function(arg) {
  let result = [];
  let apple = function(ele) {
    result.push(ele)
  }
  // this.myEach(ele => result.push(arg(ele)));
  this.myEach(ele => apple(arg(ele)));
  return result;
}

function banana(ele) {
  return ele * 2;
}
// console.log(arr.myMap(banana));

function strawberry(ele) {
  return ele * ele
}
// console.log(arr.myMap(strawberry));

//myreduce
Array.prototype.myReduce = function(cb,acc = 0) {
  let result = acc;
  if (acc === 0){
    result = this.shift();
  }
  this.myEach(ele => result += cb(ele));
  return result;
}

console.log(arr.myReduce(strawberry, 10))

