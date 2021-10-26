class View {
  constructor(game, el) {}

  setupBoard() {
    const grid = document.createElement('ul'); 
    for (let i = 1; i <= 9; i++) {
      let li = document.createElement('li');
      li.setAttribute('data-row', Math.floor(i / 3)); 
      li.setAttribute('data-col', (i % 3)); 
      li.style.borderStyle = "solid";
      li.style.backgroundColor = "grey";
      li.classList.add('square');
      grid.appendChild(li); 
    }
    grid.style.display = "flex"; //flex gives fixed width 
    grid.style.flexWrap = "wrap";

    //Create event listener for hover:
    const squares = document.querySelectorAll('.square'); 
    squares.forEach(square => {
      square.addEventListener('mouseover', () => {
        square.style.backgroundColor = "yellow"; 
      })
      //accounting for when a user stops hovering:
      square.addEventListener('mouseout', () => {
        square.style.backgroundColor = "grey"; 
      })
    })
  }

  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}


module.exports = View;
