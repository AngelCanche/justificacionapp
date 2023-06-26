import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:justification/bloc/provider.dart';
import 'package:justification/pages/crear_alumno.dart';
import 'package:justification/pages/crear_alumnocopy.dart';
import 'package:justification/pages/crear_maestro.dart';
import 'package:justification/pages/home_page.dart';
import 'package:justification/pages/login_page.dart';
import 'package:justification/pages/registro_page.dart';
import 'package:justification/preferencias_usuario/preferencias_usuario.dart';
import 'package:justification/widgets/cardscopy.dart';
import 'package:justification/widgets/lista.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = new PreferenciasUsuario();
   await prefs.initPrefs();

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
//final bloc = Provider.of(context);
    final prefs = new PreferenciasUsuario();
    print(prefs.token);


    return Provider(
       key: UniqueKey(),
      child : MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('en'),//English
        Locale('es')//Espanish
      ],

      initialRoute: 'login',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context) => RegistroPage(),
        'lista': (BuildContext context) => ListaPage(),
        'cardscopy': (BuildContext context) => Home(),
        'tipo' : (BuildContext context) => MaestroPage(),
        'mcuenta' : (BuildContext context) => MaestroPage(),
        'acuenta': (BuildContext context) => CrearAlumno(),
        'acuentacopy': (BuildContext context) => CrearAlumnocopy(),
      // 'mcuenta': (BuildContext context) => CuentaMPage(),
      },
    ),
    
    );
    
    
    
  }
  
}

