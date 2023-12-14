import 'dart:convert';

import 'package:asetapp/config/app_constant.dart';
import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../aset/homepage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //deklarasi variabel
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //function login
  void login(BuildContext context) {
    //validasi
    bool isValid = formKey.currentState!.validate();

    if (isValid) {
      Uri url = Uri.parse('${BaseUrl.baseUrl}/user/login.php');
      http.post(
        url,
        body: {'username': txtUsername.text, 'password': txtPassword.text},
      ).then(
        (response) {
          DMethod.printResponse(response);
          Map resBody = jsonDecode(response.body);
          bool success = resBody['success'] ?? false;
          if (success) {
            DInfo.toastSuccess('Login Success');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            DInfo.toastSuccess('Login Failed');
          }
        },
      ).catchError((onError) {
        DInfo.toastError('adas yang salah');
        DMethod.printTitle('catchError', onError.toString());
      });
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
                    onPressed: () {
                      login(context);
                    },
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
