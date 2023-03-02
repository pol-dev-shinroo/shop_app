import 'package:flutter/material.dart';
import "../providers/products.dart";
import "package:provider/provider.dart";

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // const ProductDetailScreen(this.title, this.price, {super.key});

  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    // listen: false => only for the first build
    // do this if you only need data one time, you are not interested in updates
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
