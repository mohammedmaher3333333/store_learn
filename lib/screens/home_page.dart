import 'package:flutter/material.dart';
import 'package:store_learn/models/product_model.dart';
import 'package:store_learn/services/get_all_product_services.dart';
import 'package:store_learn/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('New Trend'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    CustomCard(product: products[index]),
              );
            } else {
              return const Center(child: Text('No products found'));
            }
          },
        ),
      ),
    );
  }
}
