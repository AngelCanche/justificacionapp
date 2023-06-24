import 'package:app_justificacion/widgets/appbar.dart';
import 'package:app_justificacion/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CrearJustificacion extends StatefulWidget {
  const CrearJustificacion({super.key});

  @override
  State<CrearJustificacion> createState() => _CrearJustificacionState();
}

class _CrearJustificacionState extends State<CrearJustificacion> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String? _opcionSeleccionada = 'Programacion';
  List<String> _poderes = [
    'Programacion',
    'Contabilidad',
    'Electricidad',
    'Recursos Humanos',
    'Ciencia de Datos'
  ];

  String? _semestredefault = '1° semestre';
  List<String> _semestres = [
    '1° semestre',
    '2° semestre',
    '3° semestre',
    '4° semestre',
    '5° semestre',
    '6° semestre'
  ];

  String? _AulaDefecto = 'Aula 1';
  List<String> _aulas = [
    'Aula 1',
    'Aula 2',
    'Aula 3',
    'Aula 4',
    'Aula 5',
    'Aula 6'
  ];

  String? _motivoD = 'Enfermedad';
  List<String> _motivos = [
    'Enfermedad',
    'Motivos Familiares',
    'Viaje',
    'Actividades Academicas',
    'otro'
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: color(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNumcontrol(),
          const Divider(),
          _crearInput(),
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

          if (_motivoD == 'otro') _crearOtro(),

          _crearFecha(context),
          const Divider(),

          // _crearPersona()
        ],
      ),
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
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Numero de control',
          labelText: 'Numero de control',
          icon: const Icon(Icons.numbers)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre del Alumno',
          labelText: 'Nombre',
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada!),
    );
  }

  Widget _crearEmail() {
    return TextField(

        // textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(Icons.email)),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha',
          labelText: 'Fecha',
          suffixIcon: const Icon(Icons.perm_contact_cal),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
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

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        //  const Icon(Icons.border_color),
        const SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
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
            value: _semestredefault,
            items: getOpcionesDropdownSemestre(),
            onChanged: (opt) {
              setState(() {
                _semestredefault = opt;
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
            value: _AulaDefecto,
            items: getOpcionesDropdownAula(),
            onChanged: (opt) {
              setState(() {
                _AulaDefecto = opt;
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
            value: _motivoD,
            items: getOpcionesDropdownMotivo(),
            onChanged: (opt) {
              setState(() {
                _motivoD = opt;
              });
            },
          ),
        )
      ],
    );
  }
}//Llave