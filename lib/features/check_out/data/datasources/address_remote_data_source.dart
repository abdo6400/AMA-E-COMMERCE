import 'package:ama/config/database/api/api_consumer.dart';
import 'package:ama/features/check_out/data/models/address_model.dart';

import '../../../../config/database/api/end_points.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getAddresses();

  Future<AddressModel> createAddress(Map<String, dynamic> address);

  Future<bool> updateAddress(Map<String, dynamic> address);

  Future<bool> deleteAddress(int id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AddressRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<AddressModel>> getAddresses() async {
    final response = await _apiConsumer.get(EndPoints.address);
    return (response as List).map((e) => AddressModel.fromJson(e)).toList();
  }

  @override
  Future<AddressModel> createAddress(Map<String, dynamic> address) async {
    final response = await _apiConsumer.post(EndPoints.address, body: address);
    return AddressModel.fromJson(response);
  }

  @override
  Future<bool> updateAddress(Map<String, dynamic> address) async {
    final response = await _apiConsumer
        .put('${EndPoints.address}/${address['id']}', body: address);
    return response;
  }

  @override
  Future<bool> deleteAddress(int id) async {
    final response = await _apiConsumer.delete('${EndPoints.address}/$id');
    return response;
  }
}
