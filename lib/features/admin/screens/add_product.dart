import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/constants/utils.dart';
import 'package:e_commerce_app/features/admin/services/admin_services.dart';
import 'package:e_commerce_app/features/commonWidgets/button.dart';
import 'package:e_commerce_app/features/commonWidgets/textfield.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = 'Mobile';
  List<File> image = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descController.dispose();
    priceController.dispose();
    quatityController.dispose();
  }

  List<String> productCategories = [
    'Mobile',
    'Essentials',
    'Appliances',
    'Books',
    'Fashions',
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && image.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quatityController.text),
          category: category,
          images: image);
    }
  }

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      image = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              'Add Product',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  image.isNotEmpty
                      ? CarouselSlider(
                          items: image.map((e) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                e,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ))
                      : GestureDetector(
                          onTap: selectImage,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            dashPattern: [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Select Product Image',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                      controller: productNameController,
                      hinttext: 'Product Name'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    controller: descController,
                    hinttext: 'Product Description',
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                      controller: priceController, hinttext: 'Product Price'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                      controller: quatityController,
                      hinttext: 'Product Quantity'),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          category = newVal!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(txt: 'Sell', onTap: sellProduct),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
