import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_learn/models/product_model.dart';
import 'package:store_learn/services/update_product_services.dart';
import 'package:store_learn/widgets/custom_button.dart';
import 'package:store_learn/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, price, description, image;
  bool isLoading = false;
  late ProductModel product; // استخدام late بدلاً من استرجاع المنتج في build

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // استرجاع المنتج في didChangeDependencies بدلاً من initState
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                const SizedBox(height: 100),
                CustomTextField(
                  controller: TextEditingController(text: product.title),
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: TextEditingController(text: product.description),
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(text: product.price.toString()),
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: TextEditingController(text: product.image),
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  textButton: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    double? parsedPrice;
    try {
      if (price != null) {
        parsedPrice = double.parse(price!);
      } else {
        // تأكد من تحويل السعر إلى double
        parsedPrice = (product.price as num).toDouble();
      }
    } catch (e) {
      print('Invalid price format: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid price'),
        ),
      );
      return;
    }

    try {
      await UpdateProductServices().updateProduct(
        id: product.id,
        title: productName ?? product.title,
        price: parsedPrice ?? 0.0, // تعيين قيمة افتراضية إذا كان parsedPrice هو null
        description: description ?? product.description,
        image: image ?? product.image,
        category: product.category,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product updated successfully!'),
        ),
      );
    } catch (e) {
      print('Error updating product: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update product. Please try again.'),
        ),
      );
    }
  }


}
