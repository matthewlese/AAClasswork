import React from "react"
import ReactDOM from "react-dom"
import Widgets from "./widgets.jsx"

document.addEventListener("DOMContentLoaded",() =>{
  const main = document.getElementById("main")
  ReactDOM.render(<Widgets/>,main)
})
