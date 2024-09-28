import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/custom_print.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    CustomPrint.printBlocEvent('\x1B[35m[Bloc Created]\x1B[0m -- ${bloc.runtimeType}'); // Purple for creation
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    CustomPrint.printBlocEvent('\x1B[36m[Bloc Changed]\x1B[0m -- ${bloc.runtimeType}, $change'); // Cyan for changes
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    CustomPrint.printBlocEvent('\x1B[31m[Bloc Error]\x1B[0m -- ${bloc.runtimeType}, $error'); // Red for errors
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    CustomPrint.printBlocEvent('\x1B[33m[Bloc Closed]\x1B[0m -- ${bloc.runtimeType}'); // Yellow for closure
  }
}
