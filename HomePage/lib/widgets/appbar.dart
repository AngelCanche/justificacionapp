

import 'package:flutter/material.dart';
import 'package:justifications/pages/login_page.dart';

color(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Image(
      image: AssetImage('assets/LogoHeader.png'),
    ),
    backgroundColor: Color.fromARGB(255, 66, 1, 1),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      icon(context)
    ],
  );
}


icon(BuildContext context){
  return IconButton(onPressed: () {
        final route = MaterialPageRoute(
          builder: (context){
            return LoginPage();
          } 
          );
           Navigator.push(context, route);
      }, icon: Icon(Icons.login));
}




