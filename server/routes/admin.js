const express = require('express')
const adminRouter = express.Router()
const admin = require('../middleware/admin_middleware');
const { Product } = require('../models/product');

// Add product
adminRouter.post('/admin/add-product', admin, async (req, res) => {
  try {
    const{ name, description, images, quantity, price, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    })
    productSave = await product.save();
    res.json(productSave);
    
  } catch (error) {
    res.status(500).json({error : error.message})
  }
})

//get product data

adminRouter.get('/admin/get-products', admin, async(req, res)=>{
  try {
    const products = await Product.find({})
    res.json(products)
  } catch (error) {
    res.status(500).json({error: error.message})
  }
})

//Delete product
adminRouter.post('/admin/delete-product', admin, async (req, res)=>{
  try {
    const {id} = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
    
  } catch (error) {
    res.status(500).json({error : error.message})
  }
})

module.exports = adminRouter;

