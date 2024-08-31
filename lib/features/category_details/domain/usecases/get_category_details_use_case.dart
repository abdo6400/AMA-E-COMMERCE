import 'package:dartz/dartz.dart';
import '../entities/category_details.dart';
import '../repositories/category_repository.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';

class GetCategoryDetailsUseCase implements UseCase<CategoryDetails, int> {
  final CategoryRepository repository;

  GetCategoryDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryDetails>> call(int id) async {
    return await repository.getCategoryDetails(id);
  }
}

