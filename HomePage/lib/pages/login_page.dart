
import 'package:flutter/material.dart';
import 'package:justification/bloc/provider.dart';
import 'package:justification/utils/utils.dart';
import 'package:justification/widgets/appbarLR.dart';

import '../bloc/login_bloc.dart';
import '../bloc/provider.dart';
import '../providers/user.dart';


class LoginPage extends StatelessWidget {
final usuarioProvider = new UsuarioProvider();

   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: colorR(), body: cuerpo(context));
  }


Widget cuerpo(BuildContext context) {
   final bloc = Provider.of(context);
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
            _username(bloc),
            _password(bloc),
            _crearButton(bloc),
            _crearNCuenta(context),
            
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

Widget _username(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: TextField(
          onChanged: bloc.ChangeEmail,
          decoration: InputDecoration(
            counterText:snapshot.data ,
             errorText : snapshot.error?.toString(),
             labelText: 'Email',
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person, color: Colors.red.shade900)),
        ),
      );
    });
}







Widget _password(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: TextField(
          onChanged: bloc.ChangePassword,
          decoration: InputDecoration(
            counterText: snapshot.data,
            errorText : snapshot.error?.toString(),
            hintText: "Password",
            labelText: 'password',
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
  );
}

Widget _crearNCuenta(BuildContext context) {
  return TextButton(
    child: Text(
      'Crear una nueva cuenta',
      style: TextStyle(color: Colors.red.shade900),
    ),
    onPressed: () => Navigator.pushReplacementNamed(context, 'registro'),
  );
}


Widget _crearButton(LoginBloc bloc) {
  return StreamBuilder(
    stream:bloc.formValidStream ,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.all(22),
        child: ElevatedButton(
          onPressed:  snapshot.hasData ? ()=> _loginn(bloc, context) : null,

          
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            backgroundColor: Colors.red.shade900,
          ),
        ),
      );
    }
  );
  
}

_login(LoginBloc bloc, BuildContext context){ 
  usuarioProvider.login(bloc.email, bloc.password);
}


_loginn(LoginBloc bloc, BuildContext context)async{

Map info =  await usuarioProvider.login(bloc.email, bloc.password);
  
  if (info['ok']){
  Navigator.pushNamed(context, 'home');

  }else {
    mostrarAlerta(context, info['mensaje']);
  }


  //print('========');
  //print('email: ${bloc.email}');
  //print('password: ${bloc.password}');
  //print('========');

  
}


}