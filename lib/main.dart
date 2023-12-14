import 'package:ecommerce_app/screen/cart/cart_screen.dart';
import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:ecommerce_app/screen/product/product_screen.dart';
import 'package:ecommerce_app/screen/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) => const HomeScreen(),
        "product":(context) => ProductScreen(),
        "cart":(context) => CartScreen(),

      },
    ),
  );
}
