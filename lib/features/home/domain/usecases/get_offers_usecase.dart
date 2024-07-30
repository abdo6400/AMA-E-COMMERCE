import 'package:dartz/dartz.dart';
import '../entities/offer.dart';
import '../repositories/home_repository.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';

class GetOffersUseCase implements UseCase<List<Offer>, NoParams> {
  final HomeRepository repository;

  GetOffersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Offer>>> call(NoParams params) async {
    return await repository.getOffers();
  }
}
