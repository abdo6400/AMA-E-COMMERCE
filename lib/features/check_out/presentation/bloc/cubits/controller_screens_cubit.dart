import 'package:bloc/bloc.dart';

class ControllerScreensCubit extends Cubit<int> {
  ControllerScreensCubit() : super(0);

  void changeCurrentPage(int index) {
    emit(index);
  }
}
