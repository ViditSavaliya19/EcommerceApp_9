import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/global.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0;

  @override
  void initState() {
    super.initState();

    count();
  }

  void count() {
    total=0;
    for (int i = 0; i < cartList.length; i++) {
      total = total + (cartList[i]['price'] as int);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  cartList.length,
                  (index) => Container(
                    margin: const EdgeInsets.all(10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "${cartList[index]['image']}",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${cartList[index]['name']}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$ ${cartList[index]['price']}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: orange,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cartList.removeAt(index);
                              count();
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(color: white, boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 2)
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$ $total",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("Check Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
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
