import 'package:flutter/material.dart';

color() {
  return AppBar(
    centerTitle: true,
    title: Image(
      image: AssetImage('assets/LogoHeader.png'),
    ),
    backgroundColor: Color.fromARGB(255, 66, 1, 1),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.login)),
    ],
  );
}
