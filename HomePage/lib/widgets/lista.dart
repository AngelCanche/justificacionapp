import 'package:justification/widgets/appbar.dart';
import 'package:justification/widgets/cards.dart';
import 'package:justification/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

    Future<List> obtenerRegistros() async {
    final response = await http.get("https://miguelpoot.000webhostapp.com/jtions/getdata.php");
    return json.decode(response.body);
  }



class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  late Future<List<dynamic>> _registrosFuture;

  @override
  void initState() {
    super.initState();
    _registrosFuture = obtenerRegistros();



    


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(context),
      body: FutureBuilder<List<dynamic>>(
        
        future: _registrosFuture,
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
                  title: Text(registro['nombre']),
                  subtitle: Text(registro['numcontrol']),
                );
              },
            );
          } else {
            return Center(child: Text('No se encontraron registros.'));
          }
        },
      ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     drawer: menu(context),
  //     appBar: color(context),
  //     body: ListView(
  //       padding: EdgeInsets.all(15.0),
  //       children: [
  //         cardlistAlumnos(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         cardlistAlumnos2(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         cardlistAlumnos3(),
  //         SizedBox(
  //           height: 20,
  //         ),
  //       ],
  //     ),
  //   );
  // }
