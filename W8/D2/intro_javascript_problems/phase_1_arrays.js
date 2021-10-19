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

console.log([5, 4, 6, -5, 1, 2, 3, -4].twoSum())