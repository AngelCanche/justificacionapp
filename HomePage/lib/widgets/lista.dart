import 'package:flutter/material.dart';
import 'package:justifications/widgets/appbar.dart';
import 'package:justifications/widgets/cards.dart';
import 'package:justifications/widgets/drawer.dart';

class ListaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: menu(context),
      appBar: color(context),
      
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          cardlistAlumnos(),
          SizedBox(
            height: 20,
          ),
          cardlistAlumnos2(),
          SizedBox(
            height: 20,
          ),
          cardlistAlumnos3(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      
      
    );
  }
}