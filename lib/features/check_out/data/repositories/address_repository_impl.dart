

import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/entities/address.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_data_source.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  AddressRepositoryImpl({required AddressRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override

  Future<Either<Failure, List<Address>>> getAddresses() async {
    try {
      return Right(await _remoteDataSource.getAddresses());
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Address>> createAddress(Map<String, dynamic> address) async {
    try {
      return Right(await _remoteDataSource.createAddress(address));
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> updateAddress(Map<String, dynamic> address) async {
    try {
      return Right(await _remoteDataSource.updateAddress(address));
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAddress(int id) async {
    try {
      return Right(await _remoteDataSource.deleteAddress(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}