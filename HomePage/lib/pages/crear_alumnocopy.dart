//@dart=2.9
import 'package:justification/pages/home_page.dart';
import 'package:justification/widgets/appbar.dart';
import 'package:justification/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CrearAlumnocopy extends StatefulWidget {
  

  @override
  State<CrearAlumnocopy> createState() => _CrearAlumnoState();
}

class _CrearAlumnoState extends State<CrearAlumnocopy> {


     String selectedValue;
      List especialidadItemList = [];//lista

        //conexion a la base de datos para mostrarlo inicio codigo
Future getAllEspecialidad( )async{
      
      var url ="https://miguelpoot.000webhostapp.com/jtions/selectespecialidad.php";
      var response = await http.get(url);
      if(response.statusCode == 200) {
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


//fin codigo
 TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerNumControl = new TextEditingController();
  TextEditingController controllerCurp = new TextEditingController();
  TextEditingController controllerDomicilio = new TextEditingController();
  TextEditingController controllerCorreo = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerNumeroTutor = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  
  void crearAlumno() async {

    // var ip = "172.29.112.1";
    //var url = "http://192.168.1.104/xampp/jtions/adddata.php";
    var url = "https://miguelpoot.000webhostapp.com/jtions/adddata.php";
    //var url = "https://miguelpoot.000webhostapp.com/jtions/adddatam.php";
    

    http.post(url, body: {

        "nombre": controllerUsername.text,
      "carrera": selectedValue.toString(),
      "numcontrol": controllerNumControl.text,
      "curp": controllerCurp.text,
      "domicilio": controllerDomicilio.text,
      "correo": controllerCorreo.text,
      "telefono": controllerTelefono.text,
      "numerotutor": controllerNumeroTutor.text,

    });


  }

  //no sirve
  String _opcionSeleccionada = 'Programación';
  final List<String> _poderes = [
    'Programación',
    'Contabilidad',
    'Electricidad',
    'Recursos Humanos',
    'Ciencia de Datos'
  ]; //final del codigo de que no sirve

  // final TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: menu(context),
      appBar: color(context),
      body: SingleChildScrollView(
        // key: _formKey,
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Form(
          child: Column(
        children: <Widget>[

          _crearNumcontrol(),
          const Divider(),
          _crearNombre(),
          const Divider(),
          _crearCurp(),
          const Divider(),
          _crearDireccion(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearTelefono(),
          const Divider(),
          _crearTelefonoTutor(),
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
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero de control',
          labelText: 'Numero de control',
          icon: const Icon(Icons.numbers)),
      
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      controller: controllerUsername,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del Alumno',
          labelText: 'Nombre',
          icon: const Icon(Icons.account_circle)),
      
    );
  }
  // Widget _crearNombre() {
  //   return TextFormField(
  //     textCapitalization: TextCapitalization.sentences,
  //     decoration: InputDecoration(labelText: 'Nombre'),
  //     controller: controllerUsername,
  //   );
  // }
   Widget _crearCurp() {
    return TextField(
      controller: controllerCurp,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Curp del Alumno',
          labelText: 'Curp',
          icon: const Icon(Icons.add_moderator)),
      
    );
  }

  Widget _crearTelefono() {
    return TextField(
      controller: controllerTelefono,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Telefono del Alumno',
          labelText: 'Telefono del alumno',
          icon: const Icon(Icons.add_call)),
      
    );
  }

  Widget _crearTelefonoTutor() {
    return TextField(
      controller: controllerNumeroTutor,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Telefono del tutor',
          labelText: 'Telefono del tutor',
          icon: const Icon(Icons.add_call)),
      
    );
  }

  Widget _crearDireccion() {
    return TextField(
      controller: controllerDomicilio,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Domicilio del Alumno',
          labelText: 'Domicilio',
          icon: const Icon(Icons.add_home_sharp)),
      
    );
  }



  Widget _crearEmail() {
    return TextField(

        // textCapitalization: TextCapitalization.sentences,
      controller: controllerCorreo,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(Icons.email)),
            );
  }





  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }
  List<DropdownMenuItem<String>> getOpcionesDropdowns() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  // Widget _crearDropdown() {
  //   return Row(
  //     children: <Widget>[
  //       //  const Icon(Icons.border_color),
  //       const SizedBox(width: 30.0),
  //       Expanded(
  //         child: DropdownButton(
  //           // value: _opcionSeleccionada,
  //           items: getOpcionesDropdown(),
  //           onChanged: (opt) {
  //             setState(() {
  //               _opcionSeleccionada = opt;
  //             });
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }
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
            items : especialidadItemList.map((especialidad){
              return DropdownMenuItem(
                value: especialidad['carrera'], 
                child: Text(especialidad['carrera']));
            }).toList(), 
            onChanged: (value){
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
        crearAlumno();
         Navigator.pop(context);
        print(especialidadItemList);
        
      },
    );
  }
}