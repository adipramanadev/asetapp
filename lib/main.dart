import 'package:asetapp/pages/aset/homepage.dart';
import 'package:flutter/material.dart';

import 'pages/user/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.purple[50],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 40,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              Colors.purple,
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
