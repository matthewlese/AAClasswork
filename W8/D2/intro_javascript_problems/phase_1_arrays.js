Array.prototype.uniq = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) { //this is the array .uniq is being called on
    if (!result.includes(this[i])) {
      result.push(this[i])
    }
  }
  return result
}

// console.log([1,2,2,3,3,3].uniq())

Array.prototype.twoSum = function() {
  let result = [];
  let sumHash = {};
  for (let i = 0; i < this.length; i++) {
    // debugger
    if (Object.keys(sumHash).includes(`${-this[i]}`)) {
      result.push([sumHash[-this[i]], i])
    } else {
      sumHash[this[i]] = i;
    }
  }
  return result;
}

// console.log([5, 4, 6, -5, 1, 2, 3, -4].twoSum())

//
Array.prototype.mytranspose = function() {
  let result = [];
  for (let j = 0; j < this[0].length; j++){
    let col = [];
    for (let i = 0; i < this.length; i++) {
      col.push(this[i][j]);
    }
    result.push(col);
  }
  return result;
}

let test = [[1,2,3],[4,5,6],[7,8,9]]
console.log(test.mytranspose())

