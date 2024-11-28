import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint("On create: ${bloc.runtimeType}");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(
        "On change: ${bloc.runtimeType}: ${change.currentState} >> ${change.nextState}");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("On close: ${bloc.runtimeType}");
    super.onClose(bloc);
  }
}
