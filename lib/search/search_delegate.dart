// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate {


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
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
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
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
    // TODO: implement buildResults
    return Container();
    // return FutureBuilder(
    //   future: searchByPhoneNumber(query),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasData) {
    //       // Procesa los datos obtenidos en snapshot.data y muestra los resultados
    //       return ListView.builder(
    //         itemCount: snapshot.data.length,
    //         itemBuilder: (context, index) {
    //           final result = snapshot.data[index];
    //           return ListTile(
    //             title: Text(result['numcontrol']),
    //             subtitle: Text(result['nombre']),
    //           );
    //         },
    //       );
    //     } else {
    //       return Center(
    //         child: Text('No se encontraron resultados'),
    //       );
    //     }
    //   },
    // );
  }
//963421700 yo
//98955555 c
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
     if (query.isEmpty) {
    return Container(); // Retorna un widget vacío si no hay término de búsqueda
  }
  
  return FutureBuilder(
    future: searchByPhoneNumber(query),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasData) {
        // Procesa los datos obtenidos en snapshot.data y muestra los resultados
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            final result = snapshot.data[index];
            return ListTile(
              title: Text(result['numcontrol']),
              subtitle: Text(result['nombre']),
            );
          },
        );
      } else {
        return Center(
          child: Text('No se encontraron resultados'),
        );
      }
    },
  );
  //  return FutureBuilder(
  //     future: searchByPhoneNumber(query),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text('Error: ${snapshot.error}');
  //       } else if (!snapshot.hasData || snapshot.data.isEmpty) {
  //         return Text('No se encontraron resultados');
  //       } else {
  //         List<dynamic> results = snapshot.data;

  //         return ListView.builder(
  //           itemCount: results.length,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               title: Text(results[index]['nombre']),
  //               subtitle: Text(results[index]['telefono']),
  //               onTap: () {
  //                 // Realiza la acción deseada al seleccionar un resultado de búsqueda
  //               },
  //             );
  //           },
  //         );
  //       }
  //     },
  //   );

  }

  // Future<List<Map<String, dynamic>>> searchByPhoneNumber(String numcontrol) async {
  //   String url = 'https://miguelpoot.000webhostapp.com/jtions/selectedncontrol.php';

  //   Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  //   Map<String, String> body = {'numcontrol': numcontrol};

  //   http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);

  //   if (response.statusCode == 200) {
  //     // Procesa la respuesta del servidor y devuelve los resultados
  //     // Aquí asumimos que la respuesta es una lista de mapas de datos JSON
  //     List<dynamic> data = jsonDecode(response.body);
  //     return data.cast<Map<String, dynamic>>();
  //   } else {
  //     throw Exception('Error al realizar la búsqueda: ${response.statusCode}');
  //   }
  // }

  Future<List<Map<String, dynamic>>> searchByPhoneNumber(String numcontrol) async {
  String url = 'https://miguelpoot.000webhostapp.com/jtions/selectedcontrold.php';

  Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  Map<String, String> body = {'numcontrol': numcontrol};

  http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Procesa la respuesta del servidor y devuelve los resultados
    List<dynamic> data = jsonDecode(response.body);
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Error al realizar la búsqueda: ${response.statusCode}');
  }
}
}

