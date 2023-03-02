import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "./screens/products_overview_screen.dart";
import "./screens/product_detail_screen.dart";
import "./providers/products.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // not recommended to use shortcut here (value)
    // because here we are instatiating a class
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: "Lato",
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
