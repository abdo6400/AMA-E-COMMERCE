import 'package:equatable/equatable.dart';

abstract class Payment extends Equatable {
  final String paymentUrl;

  const Payment({required this.paymentUrl});
}
