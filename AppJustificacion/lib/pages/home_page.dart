import 'package:app_justificacion/widgets/drawer.dart';
import 'package:flutter/material.dart';

//import '../utils/color.dart';
import '../widgets/appbar.dart';
import '../widgets/cards.dart';

class HomePage extends StatelessWidget {
  bool _isDrawerExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(context),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          card1(context),
          SizedBox(
            height: 20,
          ),
          card2(),
          SizedBox(
            height: 20,
          ),
          card3(),
          SizedBox(
            height: 20,
          ),
          card4(),
          SizedBox(
            height: 20,
          ),
          card5(),
        ],
      ),
    );
  }
}
