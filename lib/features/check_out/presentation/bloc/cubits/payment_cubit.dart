import 'package:bloc/bloc.dart';

import '../../../../../core/utils/app_strings.dart';

class PaymentCubit extends Cubit<String> {
  PaymentCubit() : super(AppStrings.cash);

  void changePaymentType(String type) {
    emit(type);
  }
}
