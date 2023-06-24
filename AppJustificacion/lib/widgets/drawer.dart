import 'package:app_justificacion/pages/crear_justificacion.dart';
import 'package:app_justificacion/pages/login_page.dart';
import 'package:flutter/material.dart';

//import '../utils/colors.dart';

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
          onTap: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Iniciar sesión',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return LoginPage();
            });

            Navigator.push(context, route);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.article,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Crear Justificacion',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return CrearJustificacion();
            });

            Navigator.push(context, route);
          },
        ),
      ],
    ),
  );
}
