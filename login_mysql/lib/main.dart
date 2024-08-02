import 'package:flutter/material.dart';
import 'package:login_mysql/Homepage.dart';
import 'package:login_mysql/registration_page.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login_Mysql',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      routes: {
        '/homepage': (context) => HomePage(),
        '/registration_page': (context) => RegistrationPage(),
        '/login': (context) => LoginPage(),
      },
      home: LoginPage(),
    );
  }
}
