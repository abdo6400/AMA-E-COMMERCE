import 'package:ama/features/check_out/data/datasources/check_out_remote_data_source.dart';
import 'package:ama/features/check_out/domain/entities/payment.dart';
import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/repositories/check_out_repository.dart';

class CheckOutRepositoryImpl extends CheckOutRepository {
  final CheckOutRemoteDataSource _checkOutRemoteDataSource;

  CheckOutRepositoryImpl({ required CheckOutRemoteDataSource remoteDataSource}) : _checkOutRemoteDataSource = remoteDataSource;


  @override
  Future<Either<Failure, String>> checkoutCash(
      {required String addressId, String? couponCode}) async {
    try {
      return Right(await _checkOutRemoteDataSource.checkoutCash(
          addressId: addressId, couponCode: couponCode));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, Payment>> checkoutCard({required String addressId, String? couponCode}) async{
  try {
      return Right(await _checkOutRemoteDataSource.checkoutCard(
          addressId: addressId, couponCode: couponCode));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  
}
