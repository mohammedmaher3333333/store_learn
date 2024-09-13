import 'package:flutter/material.dart';
import 'package:store_learn/widgets/custom_button.dart';
import 'package:store_learn/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';
  String? productName, description, image;
  double? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  description = data;
                },
                hintText: 'Description',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  price = double.parse(data);
                },
                hintText: 'Price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'Image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                textButton: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
