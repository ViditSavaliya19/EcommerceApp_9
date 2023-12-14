import 'package:ecommerce_app/screen/product/product_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectCategory = "all";
  bool isMobile = true, isLaptop = true;
  RangeValues price = RangeValues(10000, 30000);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ecommerce"),
          centerTitle: true,
          actions: [
            InkWell(onTap: () {
              Navigator.pushNamed(context, 'cart');
            },child: Icon(Icons.shopping_cart)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                value: selectCategory,
                hint: const Text("Select"),
                items: const [
                  DropdownMenuItem(
                    value: "all",
                    child: Text("All"),
                  ),
                  DropdownMenuItem(
                    value: "laptop",
                    child: Text("Laptop"),
                  ),
                  DropdownMenuItem(
                    value: "mobile",
                    child: Text("Mobile"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectCategory = value!;
                    if (value == "laptop") {
                      isMobile = false;
                      isLaptop = true;
                    } else if (value == "mobile") {
                      isMobile = true;
                      isLaptop = false;
                    } else {
                      isMobile = true;
                      isLaptop = true;
                    }
                  });
                },
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${price.start.toInt()} - ${price.end.toInt()}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),

              RangeSlider(
                values: price,
                min: 10000,
                max: 100000,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    price =value;
                  });
                },
              ),

              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isMobile,
                child: Text(
                  "Mobile",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: isMobile,
                child: const SizedBox(
                  height: 10,
                ),
              ),
              Visibility(
                visible: isMobile,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      productList.length,
                      (index) =>   productList[index]['price']>= price.start &&  productList[index]['price'] <=price.end ? InkWell(
                        onTap: () {
                          Map m1 = productList[index];

                          Navigator.pushNamed(context, 'product',
                              arguments: m1);
                        },
                        child: Container(
                          height: 190,
                          width: 150,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "${productList[index]['image']}",
                                height: 80,
                                width: 150,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${productList[index]['name']}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 18),
                              ),
                              Text(
                                "${productList[index]['price']}",
                                style: TextStyle(fontSize: 15, color: orange),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${productList[index]['category']}",
                                    style: TextStyle(color: grey),
                                  ),
                                  Text(
                                    "${productList[index]['rate']}",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ):Container(),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: isLaptop,
                child: Text(
                  "Laptop",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: isLaptop,
                child: const SizedBox(
                  height: 10,
                ),
              ),
              Visibility(
                visible: isLaptop,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      laptopList.length,
                      (index) =>  laptopList[index]['price']>= price.start &&  laptopList[index]['price'] <=price.end ? Container(
                        height: 190,
                        width: 150,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 5)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "${laptopList[index]['image']}",
                              height: 80,
                              width: 150,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${laptopList[index]['name']}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                  fontSize: 18),
                            ),
                            Text(
                              "${laptopList[index]['price']}",
                              style: TextStyle(fontSize: 15, color: orange),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${laptopList[index]['category']}",
                                  style: TextStyle(color: grey),
                                ),
                                Text(
                                  "${laptopList[index]['rate']}",
                                ),
                              ],
                            )
                          ],
                        ),
                      ):Container(),
                    ),
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
