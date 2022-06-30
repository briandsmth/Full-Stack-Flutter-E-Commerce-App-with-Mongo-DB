const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs");

const authRouter = express.Router();


//SIGN UP
authRouter.post('/api/signup', async function (req, res) {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email is already exist!" });
    }

    const cryptPassword = await bcrypt.hash(password, 8);

    let user = new User({
      email,
      password : cryptPassword,
      name,
    })
    user = await user.save();
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;