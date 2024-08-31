import 'package:ama/config/database/error/exceptions.dart';
import 'package:ama/config/database/error/failures.dart';

import 'package:ama/features/category_details/domain/entities/category_details.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CategoryDetails>> getCategoryDetails(int id) async {
    try {
      return Right(await remoteDataSource.getCategoryDetails(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
