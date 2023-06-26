import 'package:flutter/material.dart';

import 'package:justifycations_app/bloc/login_bloc.dart';
export 'package:justifycations_app/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();

  static Provider? _instancia;

  factory Provider({required Key key, required Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia!;
  }

  Provider._internal({required Key key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }
}
