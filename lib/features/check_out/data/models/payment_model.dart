import '../../domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel({required super.paymentUrl});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(paymentUrl: json['url']);
  }

  @override
  List<Object?> get props => [super.paymentUrl];
}
