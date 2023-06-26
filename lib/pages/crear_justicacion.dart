//@dart=2.9

import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/drawer.dart';

class CrearJustificacion extends StatefulWidget {
  @override
  State<CrearJustificacion> createState() => _CrearJustificacionState();
}

class _CrearJustificacionState extends State<CrearJustificacion> {
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
    getAllControl();
  }

  String selectedValuecontrol;
  List especialidadItemListcontrol = []; //lista

  //conexion para poder mostrar las especialidades
  Future getAllControl() async {
    var url = "https://miguelpoot.000webhostapp.com/jtions/selectncontrol.php";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        especialidadItemListcontrol = jsonData;
      });
    }
    print(especialidadItemListcontrol);
  }

  TextEditingController controllerNumControl = new TextEditingController();
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerFechaI = new TextEditingController();
  TextEditingController controllerFechaF = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void crearJustificacion() async {
    var url =
        "https://miguelpoot.000webhostapp.com/jtions/adddatajust.php"; //cambiar

    http.post(url, body: {
      //   "numerocontrol": controllerNumControl.text,
      "nombre": controllerUsername.text,
      "carrera": selectedValue.toString(),
      "numerocontrol": selectedValuecontrol.toString(),
      "semestre": selectedValueS.toString(),
      "aula": selectedValueA.toString(),
      "FechaInicio": controllerFechaI.text,
      "FechaFinal": controllerFechaF.text,
      "motivo": controllerMotivo.toString(),
    });
  }

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Programacion';
  List<String> _poderes = [
    'Programacion',
    'Contabilidad',
    'Electricidad',
    'Recursos Humanos',
    'Ciencia de Datos'
  ];

  String selectedValueS = '1° semestre';
  List<String> _semestres = [
    '1° semestre',
    '2° semestre',
    '3° semestre',
    '4° semestre',
    '5° semestre',
    '6° semestre'
  ];

  String selectedValueA = 'Aula 1';
  List<String> _aulas = [
    'Aula 1',
    'Aula 2',
    'Aula 3',
    'Aula 4',
    'Aula 5',
    'Aula 6'
  ];

  String controllerMotivo = 'Enfermedad';
  List<String> _motivos = [
    'Enfermedad',
    'Motivos Familiares',
    'Viaje',
    'Actividades Academicas',
    'otro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(context),
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Form(
              child: Column(
        children: <Widget>[
          //_crearNumcontrol(),
          _crearInput(),
          const Divider(),
          _crearDropdownControl(),
          const Divider(),
          // _crearCarrera(),
          _crearDropdown(),
          const Divider(),

          _crearDropdownSemestre(),
          const Divider(),
          _crearDropdownAula(),
          const Divider(),
          _crearDropdownMotivo(),
          const Divider(),

          if (controllerMotivo == 'otro') _crearOtro(),

          _crearFechaI(context),
          const Divider(),

          _crearFechaF(context),
          const Divider(),
          _botonSubmit(),

          // _crearPersona()
        ],
      ),
      )
      )
      )
    );
  }

  Widget _crearOtro() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Especifique el motivo',
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

  Widget _crearInput() {
    return TextField(
      controller: controllerUsername,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del Alumno',
          labelText: 'Nombre',
          icon: const Icon(Icons.account_circle)),
    );
  }

//fecha inicio
  Widget _crearFechaI(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: controllerFechaI,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha Inicio',
          labelText: 'Fecha Fecha Inicio',
          suffixIcon: const Icon(Icons.perm_contact_cal),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDateI(context);
      },
    );
  }

  _selectDateI(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        controllerFechaI.text = _fecha;
      });
    }
  }

//fecha final

  Widget _crearFechaF(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: controllerFechaF,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha Final',
          labelText: 'Fecha Final',
          suffixIcon: const Icon(Icons.perm_contact_cal),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDateF(context);
      },
    );
  }

  _selectDateF(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        controllerFechaF.text = _fecha;
      });
    }
  }

  Widget _crearDropdown() {
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

  Widget _crearDropdownControl() {
    return Row(
      children: <Widget>[
        //  const Icon(Icons.border_color),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            hint: Text('Selecciona la Ncontrol'),
            value: selectedValuecontrol,
            items: especialidadItemListcontrol.map((especialidad) {
              return DropdownMenuItem(
                  value: especialidad['numcontrol'],
                  child: Text(especialidad['numcontrol']));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValuecontrol = value;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownSemestre() {
    List<DropdownMenuItem<String>> lista = [];

    _semestres.forEach((semestre) {
      lista.add(DropdownMenuItem(
        child: Text(semestre),
        value: semestre,
      ));
    });
    return lista;
  }

  Widget _crearDropdownSemestre() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: selectedValueS,
            items: getOpcionesDropdownSemestre(),
            onChanged: (opt) {
              setState(() {
                selectedValueS = opt;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownAula() {
    List<DropdownMenuItem<String>> lista = [];

    _aulas.forEach((aula) {
      lista.add(DropdownMenuItem(
        child: Text(aula),
        value: aula,
      ));
    });
    return lista;
  }

  Widget _crearDropdownAula() {
    return Row(
      children: <Widget>[
        //  const Icon(Icons.border_color),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: selectedValueA,
            items: getOpcionesDropdownAula(),
            onChanged: (opt) {
              setState(() {
                selectedValueA = opt;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdownMotivo() {
    List<DropdownMenuItem<String>> lista = [];

    _motivos.forEach((motivo) {
      lista.add(DropdownMenuItem(
        child: Text(motivo),
        value: motivo,
      ));
    });
    return lista;
  }

  Widget _crearDropdownMotivo() {
    return Row(
      children: <Widget>[
        //  const Icon(Icons.border_color),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: controllerMotivo,
            items: getOpcionesDropdownMotivo(),
            onChanged: (opt) {
              setState(() {
                controllerMotivo = opt;
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
        crearJustificacion();
        Navigator.pop(context);
        print(controllerNumControl.text);
        print(controllerUsername.text);
        //print(especialidadItemList);
        print(selectedValueS);
        print(selectedValueA);
        print(selectedValue);
        print(controllerMotivo);
        print(controllerFechaI);
        print(controllerFechaF);

        //
        //   print('el telefono es ${controllerTelefono}' );
        //print(controllerNumControl);
      },
    );
  }
} //Llave
