import 'package:bloc/bloc.dart';

class SizeCubit extends Cubit<String> {
  SizeCubit(super.size);


  void changeSize(String size) => emit(size);
}
