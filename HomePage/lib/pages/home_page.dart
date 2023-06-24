import 'package:flutter/material.dart';
import 'package:justifycations_app/widgets/drawer.dart';

import '../utils/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/cards.dart';

class HomePage extends StatelessWidget {
  bool _isDrawerExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          card1(),
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
