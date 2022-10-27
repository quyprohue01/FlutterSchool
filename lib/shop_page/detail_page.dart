import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/shop_page/headerbar_cartpage.dart';
import 'package:provider/provider.dart';

class DetailProductPage extends StatelessWidget {
  final ProductModel e;
  DetailProductPage(this.e);

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Detail Page Shop'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartShopPage()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 50),
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Image.network(
            e.image.toString(),
            width: 500,
          ),
          Expanded(
            child: Card(
              child: Container(
                margin: EdgeInsets.only(left: 250, right: 250, top: 30),
                child: Column(
                  children: [
                    Text(
                      e.title ?? "",
                      style: TextStyle(fontSize: 50),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "\$" + e.price.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Container(
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
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        e.description ?? "",
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.grey,
                              width: 5,
                            )),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: null, icon: Icon(Icons.add)),
                                IconButton(
                                    onPressed: null, icon: Icon(Icons.remove)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => pp.cart.add(e),
                            child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(color: Colors.blue),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
