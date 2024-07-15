// this class used to show states

import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/custom_print.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    CustomPrint.printTest('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    CustomPrint.printTest('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    CustomPrint.printTest('onError -- ${bloc.runtimeType}, $error');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    CustomPrint.printTest('onClose -- ${bloc.runtimeType}');
  }
}
