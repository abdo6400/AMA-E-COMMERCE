import 'package:dartz/dartz.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/bloc/usecases/usecase.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetAddressesUseCase implements UseCase<List<Address>, NoParams> {
  final AddressRepository repository;

  GetAddressesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) async {
    return await repository.getAddresses();
  }
}
