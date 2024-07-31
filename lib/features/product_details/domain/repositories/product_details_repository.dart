import 'package:dartz/dartz.dart';
import '../entities/product_details.dart';
import '../../../../../config/database/error/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDetails>> getProductDetails(int id);
}
