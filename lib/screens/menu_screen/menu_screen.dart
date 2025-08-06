import 'package:copilot_learning/core/utils/app_assets.dart';
import 'package:copilot_learning/manager/data_manager.dart';
import 'package:copilot_learning/models/data_models.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final DataManager dataManager;
  const MenuScreen({super.key, required this.dataManager});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.dataManager.getMenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // data is ready
          List<Category> menu = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) {
              Category category = menu[index];
              return ExpansionTile(
                title: Text(category.name),
                children:
                    category.products.map((product) {
                      return ProductItem(
                        product: product,
                        onAdd: (p) {
                          widget.dataManager.cartAdd(p);
                        },
                      );
                    }).toList(),
              );
            },
            itemCount: menu.length,
          );
        } else {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.brown),
            );
          }
        }
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(8.0),

      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$${product.price.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Handle button press
                      onAdd(product);
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
