import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../../../../core/entities/product.dart';
import '../repositories/home_repository.dart';

class GetBestSellingProductsUseCase
    implements UseCase<List<Product>, NoParams> {
  final HomeRepository repository;

  GetBestSellingProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(
      NoParams params) async {
    return await repository.getBestSellerProducts();
  }
}
