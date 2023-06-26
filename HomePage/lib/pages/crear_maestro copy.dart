//@dart=2.9

import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/drawer.dart';

class CrearMaestroPage extends StatefulWidget {
  @override
  State<CrearMaestroPage> createState() => _CrearMaestroPageState();
}

class _CrearMaestroPageState extends State<CrearMaestroPage> {
  String selectedValue;
  List especialidadItemList = []; //lista

  //conexion para poder mostrar las especialidades
  Future getAllEspecialidad() async {
    var url =
        "https://miguelpoot.000webhostapp.com/jtions/selectespecialidad.php";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        especialidadItemList = jsonData;
      });
    }
    print(especialidadItemList);
  }

  @override
  void initState() {
    super.initState();
    getAllEspecialidad();
  }

  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerCorreo = new TextEditingController();
  TextEditingController controllerNumControl = new TextEditingController();
  TextEditingController controllerCarrera = new TextEditingController();

  //TextEditingController controllerCurp = new TextEditingController();
  //TextEditingController controllerDomicilio = new TextEditingController();
  //TextEditingController controllerNumeroTutor = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void crearMaestro() async {
    var url = "https://miguelpoot.000webhostapp.com/jtions/adddatam.php";

    http.post(url, body: {
      "nombre": controllerUsername.text,

      "telefono": controllerTelefono.text,
      "correo": controllerCorreo.text,
      "carrera": selectedValue.toString(),
      "numcontrol": controllerNumControl.text,
      //"curp": controllerCurp.text,
      //"domicilio": controllerDomicilio.text,
      //"numerotutor": controllerNumeroTutor.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(context),
      body: SingleChildScrollView(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Form(
              child: Column(
            children: <Widget>[
              _crearNumcontrol(),
              const Divider(),
              _crearNombre(),
              const Divider(),
              _crearEmail(),
              const Divider(),
              _crearTelefono(),
              const Divider(),
              _crearDropdowns(),
              const Divider(),
              _botonSubmit(),
            ],
          )),
        ),
      ),
    );
  }

  Widget _crearNumcontrol() {
    return TextField(
      controller: controllerNumControl,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Curp',
          labelText: 'Curp',
          icon: const Icon(Icons.numbers)),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      controller: controllerUsername,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          icon: const Icon(Icons.account_circle)),
    );
  }

  Widget _crearTelefono() {
    return TextField(
      controller: controllerTelefono,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Telefono',
          labelText: 'Telefono del maestro',
          icon: const Icon(Icons.add_call)),
    );
  }

  Widget _crearEmail() {
    return TextField(
      // textCapitalization: TextCapitalization.sentences,
      controller: controllerCorreo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email)),
    );
  }

  //dropdownButton donde muestra las especialidades
  Widget _crearDropdowns() {
    return Row(
      children: <Widget>[
        //  const Icon(Icons.border_color),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            hint: Text('Selecciona la especialidad'),
            value: selectedValue,
            items: especialidadItemList.map((especialidad) {
              return DropdownMenuItem(
                  value: especialidad['carrera'],
                  child: Text(especialidad['carrera']));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _botonSubmit() {
    return ElevatedButton.icon(
      label: Text('Guardar'),
      icon: Icon(Icons.save, color: Colors.white),
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color.fromRGBO(128, 0, 0, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: () {
        crearMaestro();
        Navigator.pop(context);
        print(especialidadItemList);
        //
        //   print('el telefono es ${controllerTelefono}' );
        //print(controllerNumControl);
      },
    );
  }
}
