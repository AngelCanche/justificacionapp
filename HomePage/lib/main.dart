import 'package:flutter/material.dart';
import 'package:justifycations_app/pages/home_page.dart';
import 'package:justifications_app/pages/login_page.dart';
import 'package:justifications_app/pages/registro_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(),

        
      },
    );
  }
}
