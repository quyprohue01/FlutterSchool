import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop_page/detail_page.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/shop_page/headerbar_homepage.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      backgroundColor: Colors.blue,
      body: GridView.count(
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 3,
        childAspectRatio: (200 / 120),
        //scrollDirection: Axis.vertical,
        children: [
          ...pp.list.map((e) {
            return Card(
              child: Column(
                children: [
                  // Text(e.description ?? ""),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailProductPage(e)));
                    },
                    child: Image.network(
                      e.image.toString(),
                      width: 90,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Text(
                      e.title ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$" + e.price.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              for (int i = 1; i <= 4; i++)
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.red[900],
                                ),
                              Icon(
                                Icons.star_half,
                                size: 20,
                                color: Colors.red[900],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => pp.cart.add(e),
                              child: Row(
                                children: [
                                  Icon(Icons.add_shopping_cart),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
