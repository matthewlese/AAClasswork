const express = require("express");
const router = express.Router();
const User = require('../../models/User')
const bcrypt = require('bcryptjs')
const keys = require('../../config/keys')
const jwt = require('jsonwebtoken')
const passport = require('passport')
const validateRegisterInput = require('../../validation/register')
const validateLoginInput = require('../../validation/login')

router.get('/current', passport.authenticate('jwt', {session: false}), (req, res) => {
  res.json({
    id: req.user.id,
    handle: req.user.handle,
    email: req.user.email
  });
})

router.get("/test", (req, res) => res.json({ msg: "This is the users route" }));

router.post('/register', (req, res) => {
  const {errors, isValid} = validateRegisterInput(req.body)

  if (!isValid) {
    return res.status(400).json(errors)
  } 

  User.findOne( {email: req.body.email})
    .then(user => {
      if (user) {
        return res.status(400).json({email: 'A user is already registered with that email.'})
      } else {
        const newUser = new User({
          handle: req.body.handle,
          email: req.body.email,
          password: req.body.password
        })
        bcrypt.genSalt(10, (err, salt) => {
          bcrypt.hash(newUser.password, salt, (err, hash) => {
            if (err) throw err
            newUser.password = hash
            newUser.save()
              .then(user => res.json(user))
              .catch(err => console.log(err))
          })
        })
      }
    })
})

router.post('/login', (req, res) => {
  const {errors, isValid} = validateLoginInput(req.body)

  if (!isValid) {
    return res.status(400).json(errors)
  }
  
  const email = req.body.email
  const password = req.body.password
  User.findOne({email})
    .then(user => {
      if (!user) {
        return res.status(404).json({email: 'This user does not exist.'})
      }
      bcrypt.compare(password, user.password)
        .then(isMatch => {
          if (isMatch) {
            const payload = {
              id: user.id,
              handle: user.handle,
              email: user.email
            }
            jwt.sign(payload, keys.secretOrKey, {expiresIn: 3600}, (err, token) => {
              res.json({
                success: true,
                token: 'Bearer ' + token 
              })
            })
          } else {
            return res.status(400).json({password: 'Password is incorrect.'})
          }
        })
    })
})
// "token": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYWQ1Mzc1YzRmODBkMTVjYThkOTFiNCIsImhhbmRsZSI6Iidqb2huMiciLCJlbWFpbCI6Iidqb2huMkBqb2huLmpvaG4nIiwiaWF0IjoxNjM4NzYwNjM3LCJleHAiOjE2Mzg3NjQyMzd9.RD8-J6tvpLZdZkL_VbFmmUF5mfF-RAQmK-iG39QpCaA"


module.exports = router;