import 'package:flutter/material.dart';
import 'package:justification/pages/login_page.dart';
import 'package:justification/search/search_delegate.dart';

color(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Image(
      image: AssetImage('assets/LogoHeader.png'),
    ),
    backgroundColor: Color.fromARGB(255, 66, 1, 1),
    actions: [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
          icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.login)),
    ],
  );
}


