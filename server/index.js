console.log("Hello world!");

const express = require("express");
const mongoose = require("mongoose");
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/products');
const userRouter = require('./routes/user');

//INIT
const PORT = 3000;
const app = express();
const DB = "YOUR DB URL HERE"

//middlewares
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);


//conections
mongoose.connect(DB)
.then(() => {
    console.log("connected to mongoDB");
}).catch(e => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0",() => {
    console.log(`connected at post ${PORT}`);

    });
