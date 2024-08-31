import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/best_selling_and_reommended_product.dart';
import '../repositories/home_repository.dart';

class GetBestSellingProductsUseCase
    implements UseCase<List<BestSellingAndRecommendedProduct>, NoParams> {
  final HomeRepository repository;

  GetBestSellingProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<BestSellingAndRecommendedProduct>>> call(
      NoParams params) async {
    return await repository.getBestSellerProducts();
  }
}
