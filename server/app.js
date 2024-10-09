const express = require("express");
const cors = require("cors");
const Product = require("./product");

const app = express();

app.use(cors());

app.use(express.json());

app.use(
  express.urlencoded({
    extended: true,
  })
);
const productData = [];

app.post("/api/add_product", async (req, res) => {
  console.log("Result", req.body);

  let data = Product(req.body);

  try {
    let dataToStore = await data.save();
    res.status(200).json(dataToStore);
  } catch (error) {
    res.status(400).json({
      status: error.message,
    });
  }
});

//Get API method
app.get("/api/get_product", async (req, res) => {
  try {
    let data = await Product.find();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json(error.message);
  }
});

//Update API put
app.patch("/api/update/:id", async (req, res) => {
  let id = req.params.id;
  let updatedData = req.body;
  let options = { new: true };

  try {
    const data = await Product.findByIdAndUpdate(id, updatedData, options);
    res.send(data);
  } catch (error) {
    res.send(error.message);
  }
});

//delete method
// Corrected backend delete route
app.delete("/api/delete/:id", async (req, res) => {
  let id = req.params.id;
  try {
    const data = await Product.findByIdAndDelete(id);
    res.json({
      status: "Deleted the Product from database",
    });
  } catch (error) {
    res.json(error.message);
  }
});

app.all("*", (req, res) => {
  res.status(404).json({
    message: `Cant Find ${req.originalUrl} on this server`,
  });
});

module.exports = app;
