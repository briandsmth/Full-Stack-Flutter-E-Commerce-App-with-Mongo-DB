const express = require('express')
const adminRouter = express.Router()
const admin = require('../middleware/admin_middleware');
const Product = require('../models/product');

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

module.exports = adminRouter;

