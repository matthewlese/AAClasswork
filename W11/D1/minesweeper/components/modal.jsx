import React from 'react'

const Modal = (props) => {

  if (!props.show) {
    return null
  }

  return(
    <div className="modal">
      <div className="modal-screen">
      </div>
      <div className="modal-content">
        <h2>{props.winOrLoss}</h2>
        <div className="modal-button">
          <button onClick={props.restartGame} >New Game</button>
        </div>
      </div>
    </div>
  )
}

export default Modal