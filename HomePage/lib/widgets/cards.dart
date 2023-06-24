import 'package:flutter/material.dart';

//Card - Programación
Widget card1() {
  final card = TextButton(
    onPressed: () {
      print('click');
    },
    child: Container(
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              'assets/T_Pr.jpg',
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ),
  );
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
      ],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

//Card - Electricidad
Widget card2() {
  final card = TextButton(
    onPressed: () {
      print('click');
    },
    child: Container(
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              'assets/Electricidad.jpg',
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ),
  );
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
      ],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

//Card - Contabilidad
Widget card3() {
  final card = TextButton(
    onPressed: () {
      print('click');
    },
    child: Container(
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              'assets/Contabilidad.jpg',
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ),
  );
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
      ],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

//Card - Ciencias de datos
Widget card4() {
  final card = TextButton(
    onPressed: () {
      print('click');
    },
    child: Container(
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              'assets/Ciencias de datos.jpg',
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ),
  );
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
      ],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

//Card - Recursos Humanos
Widget card5() {
  final card = TextButton(
    onPressed: () {
      print('click');
    },
    child: Container(
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(
              'assets/RecursosHumanos.jpg',
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    ),
  );
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)),
      ],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}
