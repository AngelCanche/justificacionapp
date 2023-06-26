import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../search/search_delegate.dart';

Future<List> obtenerRegistros() async {
  final response =
      await http.get("https://miguelpoot.000webhostapp.com/jtions/getdata.php");
  return json.decode(response.body);
}

late Future<List<dynamic>> _registros = obtenerRegistros();

color(BuildContext context) {
  Future<List> _registros = obtenerRegistros();

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
    ],
  );
}
