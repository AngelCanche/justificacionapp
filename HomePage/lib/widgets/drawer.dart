
import 'package:flutter/material.dart';
import 'package:justification/pages/crear_alumno.dart';
import 'package:justification/pages/crear_justificacion.dart';
import 'package:justification/pages/crear_maestro.dart';
import 'package:justification/pages/home_page.dart';
import 'package:justification/pages/login_page.dart';
import '../pages/crear_alumnocopy.dart';
import '../pages/crear_maestro copy.dart';
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

        ListTile(
          leading: Icon(
            Icons.admin_panel_settings_outlined,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Agregar Maestro',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return MaestroPage();
            });

            Navigator.push(context, route);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.admin_panel_settings_outlined,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Agregar Maestro Copy',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
              onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return CrearMaestroPage();
            });

            Navigator.push(context, route);
          },
        ),
        

          

           ListTile(
          leading: Icon(
            Icons.settings_accessibility_outlined,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Agregar Alumno',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return CrearAlumno();
            });

            Navigator.push(context, route);
          },
        ),





        ListTile(
          leading: Icon(
            Icons.settings_accessibility_outlined,
            size: 30,
            color: Colors.red.shade900,
          ),
          title: Text(
            'Agregar Alumno copy',
            style: TextStyle(fontSize: 18, color: Colors.red.shade900),
          ),
          onTap: () {
            // Navigator.pushReplacementNamed(context,'login' );
            final route = MaterialPageRoute(builder: (context) {
              return CrearAlumnocopy();
            });

            Navigator.push(context, route);
          },
        ),






      ],
    ),
  );
}