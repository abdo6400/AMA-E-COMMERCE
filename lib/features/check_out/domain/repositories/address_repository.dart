import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../entities/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();
  Future<Either<Failure, Address>> createAddress(Map<String, dynamic> address);
  Future<Either<Failure, bool>> updateAddress(Map<String, dynamic> address);
  Future<Either<Failure, bool>> deleteAddress(int id);
}
