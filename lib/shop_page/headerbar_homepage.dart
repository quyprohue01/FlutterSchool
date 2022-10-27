import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop_page/headerbar_cartpage.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/shop_page/productlist_page.dart';
import 'package:provider/provider.dart';

class HeaderBarPage extends StatelessWidget {
  const HeaderBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    List<String> Category = [
      'All',
      'men\'s clothing',
      'jewelery',
      'electronics',
      'women\'s clothing'
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30, left: 20, right: 40),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://img.icons8.com/carbon-copy/400/shopee.png',
                    ),
                    Text(
                      'Quý\'s Tộc Shop',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Tìm kiếm',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Nhập tên sản phẩm cần tìm',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartShopPage()));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 40, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      ...Category.map(
                        (e) => Container(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.grid_view,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.format_list_bulleted_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ProductListPage()),
        ],
      ),
    );
  }
}
