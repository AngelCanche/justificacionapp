import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget menu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 66, 1, 1),
              image: DecorationImage(
                image: AssetImage('assets/LogoCbtis72_1.png'),
                scale: 9,
              )),
          child: null,
        ),
        Center(
          child: Container(
            child: Text(
              'Opciones:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Inicio',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}
