import 'package:dartz/dartz.dart';
import '../entities/wishlist_product.dart';
import '../repositories/wishlist_repository.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';

class GetWishlistProductsUseCase implements UseCase<List<WithListProduct>, NoParams> {
  final WishlistRepository repository;

  GetWishlistProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<WithListProduct>>> call(NoParams params) async {
    return await repository.getWishlistProducts();
  }
}
