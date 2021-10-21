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

reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0 ) {
    const response = reader.question('', callback);
  }
}