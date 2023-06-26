import '../widgets/appbarLR.dart';

import 'package:flutter/material.dart';

import 'crear_alumno.dart';

class MaestroPage extends StatelessWidget {
  const MaestroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: colorR(), body: cuerpo(context));
  }
}

Widget cuerpo(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 50),
    child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            nombre(),
            _username(context),
            _lastname(context),
            _phonenumber(context),
            _email(context),
            _curp(context),
            _carrera(context),
            _password(context),
            _crearButton(context),
            _crearcuentamaestro(context),
          ],
        )),
      ),
    ),
  );
}

Widget nombre() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Image(image: AssetImage('assets/LogoCbtis72_1.png')));
}

Widget _username(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Username",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person, color: Colors.red.shade900)),
    ),
  );
}

Widget _lastname(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "last name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person, color: Colors.red.shade900)),
    ),
  );
}

Widget _phonenumber(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "phonenumber",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.phone, color: Colors.red.shade900)),
    ),
  );
}

Widget _email(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.email, color: Colors.red.shade900)),
    ),
  );
}

Widget _curp(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "curp",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person, color: Colors.red.shade900)),
    ),
  );
}

Widget _carrera(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: "carrera",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person, color: Colors.red.shade900)),
    ),
  );
}

Widget _password(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(Icons.lock_sharp, color: Colors.red.shade900),
      ),
      obscureText: true,
    ),
  );
}
// Widget _crearNCuenta(BuildContext context){
//  return TextButton(
//          child:Text('Crear una nueva cuenta', style: TextStyle(color: Colors.red.shade900),) ,

//        onPressed: () {

//      },
//    );
//}

Widget _crearButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(23),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        "Registrarte",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        backgroundColor: Colors.red.shade900,
      ),
    ),
  );
}

Widget _crearcuentamaestro(BuildContext context) {
  return TextButton(
    child: Text(
      'Crear cuenta de maestro',
      style: TextStyle(color: Colors.red.shade900),
    ),
    onPressed: () {
      final route = MaterialPageRoute(builder: (context) {
        return CrearAlumno();
      });

      Navigator.push(context, route);
    },
  );
}
