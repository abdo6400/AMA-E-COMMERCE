import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());
  XFile? profilePic;
  DateTime? birthDate;
  void pikeImage(BuildContext context) async {
    emit(AuthUiChanging());
    final XFile? pickedImage = null;
    if (pickedImage != null) {
      profilePic = pickedImage;
    }
    emit(AuthUiChanged());
  }

  bool isVisiable = true;
  void changeVisiablity() {
    emit(AuthUiChanging());
    isVisiable = !isVisiable;
    emit(AuthUiChanged());
  }
}
