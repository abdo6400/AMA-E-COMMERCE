import 'package:dartz/dartz.dart';
import '../entities/category.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class GetCategoriesUseCase implements UseCase<List<Category>, NoParams> {
  final HomeRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
