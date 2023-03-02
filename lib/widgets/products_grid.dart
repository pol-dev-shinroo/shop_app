import 'package:flutter/material.dart';
import "../widgets/product_item.dart";
import "package:provider/provider.dart";
import "../providers/products.dart";

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    // render only that is visible on the screen = better optimization (good for longer list)
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      // short cut instead of using create
      // also this is recommended if not instantiating a class
      // => here we are reusing existing object product[idx]
      // hence, in the main.dart where you instantiate a class, leave it the old way

      // also changeNotifier automatically cleans up data when we add page (stack), or remove
      itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
        value: products[idx],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
