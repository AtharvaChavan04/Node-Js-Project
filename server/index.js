const express = require("express")
const cors = require("cors");
const mongoose = require("mongoose")
const Product = require("./product")

const app = express()

app.use(cors());

app.use(express.json())

app.use(express.urlencoded({
    extended: true
}))

const productData = []



//connect to mongoose
mongoose.connect("mongodb+srv://atharva:test%40123@nodejsprojectcluster.yw6u8.mongodb.net/flutter")
    .then(() => {

        //post API Method
        app.post("/api/add_product", async(req, res) => {

            console.log("Result", req.body);

            let data = Product(req.body)

            try {
                let dataToStore = await data.save()
                res.status(200).json(dataToStore)
            } catch (error) {
                res.status(400).json({
                    'status': error.message
                })
            }

            // const pdata = {
            //     "id": productData.length + 1,
            //     "pname": req.body.pname,
            //     "pprice": req.body.pprice,
            //     "pdesc": req.body.pdesc,
            // }

            // productData.push(pdata)
            // console.log("Final", pdata)

            // res.status(200).send({
            //     "status_code": 200,
            //     "message": "Product added successfully",
            //     "product": pdata,
            // })

        })

        //Get API method
        app.get("/api/get_product", async(req, res) => {

            try {
                let data = await Product.find()
                res.status(200).json(data)
            } catch (error) {
                res.status(500).json(error.message)
            }

            // if (productData.length > 0) {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "product": productData,
            //     })
            // } else {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "product": [],
            //     })
            // }
        })

        //Update API put
        app.patch("/api/update/:id", async(req, res) => {

            let id = req.params.id
            let updatedData = req.body
            let options = { new: true }

            try {
                const data = await Product.findByIdAndUpdate(id, updatedData, options)
                res.send(data)
            } catch (error) {
                res.send(error.message)
            }

            // let id = req.params.id * 1
            // let productToUpdate = productData.find(p => p.id === id);
            // let index = productData.indexOf(productToUpdate)

            // productData[index] = req.body

            // res.status(200).send({
            //     'status': "success",
            //     'message': "Product Updated",
            // })

        })

        //delete method
        // Corrected backend delete route
        app.delete("/api/delete/:id", async(req, res) => {

            let id = req.params.id
            try {
                const data = await Product.findByIdAndDelete(id)
                res.json({
                    'status': "Deleted the Product from database"
                })
            } catch (error) {
                res.json(error.message)
            }

            // let id = parseInt(req.params.id);
            // let productToDelete = productData.find(p => p.id === id);
            // let index = productData.indexOf(productToDelete);

            // if (index !== -1) {
            //     productData.splice(index, 1);
            //     res.status(200).send({
            //         status: 'success',
            //         message: "Product Deleted",
            //     });
            // } else {
            //     res.status(404).send({
            //         status: 'error',
            //         message: "Product not found",
            //     });
            // }
        });

        console.log("Connected to mongoose");
    })
    .catch((error) => {
        console.error("Error connecting to mongoose:", error);
    });



app.listen(3000, () => {
    console.log("Connected to Server at 3000")
});