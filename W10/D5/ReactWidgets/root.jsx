import React from "react"
import ReactDOM from "react-dom"
import Widget from "./widget"

document.addEventListener("DOMContentLoaded", () =>{
  const main = document.getElementById("main")
  ReactDOM.render(<Widget/>,main)
})