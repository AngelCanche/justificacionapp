import 'package:app_justificacion/widgets/appbarLR.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

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
            _password(context),
            _crearButton(context),
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
