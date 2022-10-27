// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/login_dien/dangky.dart';
import 'package:flutter_application_1/login_dien/login.dart';
// import 'package:flutter_application_1/login_dien/login_dien.dart';

// void main() {
//   runApp(MaterialApp(
//     home: LoginPage2(),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_dien/login_dien.dart';
import 'package:flutter_application_1/shop_page/headerbar_cartpage.dart';
import 'package:flutter_application_1/shop_page/detail_page.dart';
import 'package:flutter_application_1/shop_page/listview_page.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/shop_page/productlist_page.dart';
import 'package:flutter_application_1/shop_page/headerbar_homepage.dart';
import 'package:flutter_application_1/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeaderBarPage(),
    ),
  ));
}
