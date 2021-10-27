class View {
  constructor(game, el) {
    this.game = game; 
    this.el = el; 
    this.setupBoard();
  }

  setupBoard() {
    const grid = document.createElement('ul'); 
    this.el.appendChild(grid);
    for (let i = 1; i <= 9; i++) {
      let li = document.createElement('li');
      li.setAttribute('data-row', Math.floor(i / 3)); 
      li.setAttribute('data-col', (i % 3)); 
      li.style.borderStyle = "solid";
      li.style.width = "80px";
      li.style.backgroundColor = "grey";
      li.style.listStyle = "none";
      li.classList.add('square');
      grid.appendChild(li); 
    }
    grid.style.width = "300px";
    grid.style.height = "300px";
    grid.style.display = "flex"; //flex gives fixed width 
    grid.style.flexWrap = "wrap";

    //Create event listener for hover:
    const squares = document.querySelectorAll(".square"); 
    squares.forEach(square => {
      square.addEventListener('mouseover', () => {
        square.style.backgroundColor = "yellow"; 
      })
      //accounting for when a user stops hovering:
      square.addEventListener('mouseout', () => {
        square.style.backgroundColor = "grey"; 
      })
      
      square.addEventListener('click', this.handleClick.bind(this));
    }) 
  }

  
  bindEvents() {
    //done above 
  }

  handleClick(e) {
    let ele = e.target; 
    this.makeMove(ele);
  }
  
  makeMove(square) {
    square.classList.toggle('marked');
    square.setAttribute('value', this.game.currentPlayer); 
    let pos = [square.getAttribute('data-row'), square.getAttribute('data-col')];
    this.game.playMove(pos); 
  }

}


module.exports = View;
