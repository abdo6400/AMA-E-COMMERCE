import 'package:dartz/dartz.dart';
import '../entities/ad.dart';
import '../repositories/home_repository.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';

class GetAdsUseCase implements UseCase<List<Ad>, NoParams> {
  final HomeRepository repository;

  GetAdsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Ad>>> call(NoParams params) async {
    return await repository.getAds();
  }
}
