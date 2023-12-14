import 'package:ecommerce_app/screen/product/product_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/global.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ecommerce"),
          centerTitle: true,
          actions: const [
            Icon(Icons.shopping_cart),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/person.jpg",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Image.network(
                "https://www.topgear.com/sites/default/files/2022/07/13.jpg",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Text(
                "$i",
                style: const TextStyle(fontSize: 50),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i++;
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red.shade900, width: 3)),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    i--;
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red.shade900, width: 3)),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
