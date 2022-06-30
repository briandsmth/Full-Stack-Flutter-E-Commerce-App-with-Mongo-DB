const express = require('express');

const mongoose = require('mongoose');

const authRouter = require("./routes/auth");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://briandsmth:forflutter@cluster0.1yqnlxj.mongodb.net/?retryWrites=true&w=majority";

app.listen(PORT, ()=> {
  console.log(`connected port ${PORT}`)
})

//middleware
app.use(express.json());
app.use(authRouter);

//connection
mongoose.connect(DB).then(()=>{
  console.log("connection successfuly");
}).catch((e)=>{
  console.log(e);
});

//CREATING API
//Testing localhost:3000/test
// app.get("/test", (req, res) => {
//   res.send("hello world");
// });

// app.get("/", (req, res) => {
//   res.json({Name: "Briand"});
// });
//GET, POST, PUT, DELETE, UPDATE METHOD