import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../entities/category_details.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryDetails>> getCategoryDetails(int id);
}
