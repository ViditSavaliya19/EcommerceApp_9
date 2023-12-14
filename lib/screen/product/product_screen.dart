import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/global.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map m1 = {};

  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffededed),
        appBar: AppBar(
          title: const Text("Product Name"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Image.asset(
                "${m1['image']}",
                width: 250,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${m1['name']}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${m1['price']}",
                    style: TextStyle(
                        fontSize: 20,
                        color: orange,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "${m1['category']}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    "${m1['rate']}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Icon(Icons.star_rate_rounded)
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                  cartList.add(m1);
                  Navigator.pop(context);
              },
              child: Container(
                height: 80,
                width: double.infinity,
                color: orange,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
