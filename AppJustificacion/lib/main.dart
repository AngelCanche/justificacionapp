import 'package:appnavegacion/pages/pagina02.dart';
import 'package:flutter/material.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
title: "Mi App",
home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         const Text(
           "Home",
         ),
        ElevatedButton(
         child: const Text("Ir a la otra pagina"),
          onPressed: ()=>{
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> Pagina02())
            )
          }
 
           )

       ],
     ),
      ),
        );
  }
}
