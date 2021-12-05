const express = require('express')
const app = express()
const port = process.env.PORT || 5000
const mongoose = require('mongoose')

const db = require('./config/keys').mongoURI
mongoose
.connect(db, { useNewUrlParser: true })
.then(() => console.log("Connected to MongoDB successfully"))
.catch(err => console.log(err));

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get("/", (req, res) => {
  console.log(res)
  res.send("Hello World 2")
})

const users = require("./routes/api/users");
const tweets = require("./routes/api/tweets");
app.use("/api/users", users);
app.use("/api/tweets", tweets);

app.listen(port, () => console.log(`Server is running on port ${port}`))