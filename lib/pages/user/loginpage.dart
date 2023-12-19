import 'package:asetapp/config/app_constant.dart';
import 'package:asetapp/helpers/helper.dart';
import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';

import '../aset/homepage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //deklarasi variabel
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _klikLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      bool loginSuccess = await dbHelper.login(
          txtUsername.text.trim(), txtPassword.text.trim());

      if (loginSuccess) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.purple[300],
            ),
          ),
          Positioned(
            bottom: -90,
            right: -60,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.purple[300],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Icon(
              Icons.scatter_plot,
              size: 100,
              color: Colors.purple[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BaseUrl.appName.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.purple,
                        ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: txtUsername,
                    validator: (value) =>
                        value == '' ? 'Username Tidak Boleh Kosong' : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Username',
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.person,
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: txtPassword,
                    validator: (value) =>
                        value == '' ? 'Password Tidak Boleh Kosong' : null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Password',
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => _klikLogin(context),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
