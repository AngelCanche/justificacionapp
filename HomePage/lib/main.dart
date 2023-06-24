import 'package:flutter/material.dart';
import 'package:justifications/pages/home_page.dart';
import 'package:justifications/pages/login_page.dart';
import 'package:justifications/pages/registro_page.dart';
import 'package:justifications/widgets/lista.dart';


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
        'lista' : (BuildContext context) => ListaPage(),

        
      },
    );
  }
}
