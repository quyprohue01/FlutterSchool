import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class ListCartPage extends StatelessWidget {
  const ListCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      body: ListView(
        children: [
          ...pp.cart.map(
            (e) {
              return Card(
                margin: EdgeInsets.only(left: 200, top: 10, right: 200),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        e.image.toString(),
                        width: 50,
                      ),
                      Text(e.title ?? ''),
                      Text(e.category ?? ''),
                      Text('\$' + e.price.toString()),
                      Container(
                        child: Row(
                          children: [
                            IconButton(onPressed: null, icon: Icon(Icons.add)),
                            IconButton(
                                onPressed: null, icon: Icon(Icons.remove)),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            Text('Xóa'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
