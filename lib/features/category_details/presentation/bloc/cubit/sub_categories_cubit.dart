import 'package:bloc/bloc.dart';

class SubCategoriesCubit extends Cubit<int> {
  SubCategoriesCubit() : super(0);

  void changeIndex(int index) => emit(index);
}
