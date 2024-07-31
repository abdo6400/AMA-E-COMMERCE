import 'package:dartz/dartz.dart';
import '../../domain/entities/product_details.dart';
import '../../domain/repositories/product_details_repository.dart';
import '../datasources/product_details_remote_data_source.dart';
import '../../../../../config/database/error/exceptions.dart';
import '../../../../../config/database/error/failures.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(int id) async {
    try {
      final productDetails = await remoteDataSource.getProductDetails(id);
      return Right(productDetails);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
