import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Đăng nhập hệ thống"),
            Image.asset(
              'assets/images/EVN.png',
              width: 300,
            ),
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                  label: Text("Tên đăng nhập"),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.black12),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "vui lòng nhập tên đăng nhập",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(Icons.person)),
              validator: (str) {
                if (str == null || str.isEmpty)
                  return "Tên đăng nhập không được rỗng";
                return null;
              },
            ),
            TextFormField(
              controller: passWordController,
              decoration: InputDecoration(
                label: Text("Mật khẩu"),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black12),
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "vui lòng nhập tên đăng nhập",
                prefixIcon: Icon(Icons.key),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (str) {
                if (str == null || str.isEmpty)
                  return "Tên đăng nhập không được rỗng";
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var userName = userNameController.text;
                    print("xin chào: ${userName}");
                  } else {
                    print("Dữ liệu không chính xác");
                  }
                },
                child: Text("Đăng nhập"))
          ],
        ),
      ),
    );
  }
}
