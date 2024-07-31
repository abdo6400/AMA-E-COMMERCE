import 'package:dartz/dartz.dart';
import '../entities/product_details.dart';
import '../repositories/product_details_repository.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/bloc/usecases/usecase.dart';

class GetProductDetailsUseCase implements UseCase<ProductDetails, int> {
  final ProductRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductDetails>> call(int params) async {
    return await repository.getProductDetails(params);
  }
}
