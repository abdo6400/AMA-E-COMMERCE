import 'package:ama/config/database/api/api_consumer.dart';

import '../../../../config/database/api/end_points.dart';
import '../models/payment_model.dart';

abstract class CheckOutRemoteDataSource {
  Future<String> checkoutCash({required String addressId, String? couponCode});
  Future<PaymentModel> checkoutCard(
      {required String addressId, String? couponCode});
}

class CheckOutRemoteDataSourceImpl implements CheckOutRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CheckOutRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<String> checkoutCash(
      {required String addressId, String? couponCode}) async {
    final response = await _apiConsumer.post(EndPoints.checkoutCash, body: {
      'addressId': addressId,
      if (couponCode != null) 'couponCode': couponCode
    });
    return response["id"].toString();
  }

  @override
  Future<PaymentModel> checkoutCard(
      {required String addressId, String? couponCode}) async {
    final response = await _apiConsumer.post(EndPoints.checkoutCard, body: {
      'addressId': addressId,
      if (couponCode != null) 'couponCode': couponCode
    });
    return PaymentModel.fromJson(response);
  }
}
