import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit(super.color);

  void changeColor(Color color) => emit(color);
}
