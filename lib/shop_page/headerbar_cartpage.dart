import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/shop_page/listcart_page.dart';
import 'package:provider/provider.dart';

class CartShopPage extends StatelessWidget {
  const CartShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50, top: 30, bottom: 30),
                  child: Row(
                    children: [
                      Image.network(
                        'data:image/png;base64,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',
                        width: 45,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          'Quý\'s tộc Shop',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 30),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.deepOrange),
                          ),
                        ),
                        child: Text(
                          'Giỏ hàng',
                          style:
                              TextStyle(fontSize: 30, color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50, top: 30, bottom: 30),
                  child: const SizedBox(
                    width: 300,
                    child: TextField(
                      style: TextStyle(color: Colors.deepOrange),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                        labelText: 'Tìm kiếm',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'Nhập tên sản phẩm cần tìm',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ListCartPage()),
        ],
      ),
    );
  }
}
