import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/best_selling.dart';
import '../repositories/home_repository.dart';

class GetBestSellingProductsUseCase
    implements UseCase<List<BestSellingProduct>, NoParams> {
  final HomeRepository repository;

  GetBestSellingProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<BestSellingProduct>>> call(
      NoParams params) async {
    return await repository.getBestSellerProducts();
  }
}
