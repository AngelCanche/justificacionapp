import 'package:app_justificacion/widgets/appbar.dart';
import 'package:app_justificacion/widgets/cards.dart';
import 'package:app_justificacion/widgets/drawer.dart';
import 'package:flutter/material.dart';

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
