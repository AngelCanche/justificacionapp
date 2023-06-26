import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> obtenerRegistros() async {
  final response =
      await http.get("https://miguelpoot.000webhostapp.com/jtions/getdata.php");
  return json.decode(response.body);
}

late Future<List<dynamic>> _registros = obtenerRegistros();

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _registros,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
              // return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List? registros = snapshot.data;

              return ListView.builder(
                itemCount: registros!.length,
                itemBuilder: (context, index) {
                  dynamic registro = registros[index];

                  // Muestra los valores de las columnas en el ListTile
                  return ListTile(
                    title: Text(
                      registro['numcontrol'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(registro['nombre']),
                  );
                },
              );
            } else {
              return Center(child: Text('No se encontraron registros.'));
            }
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center();
  }
}
