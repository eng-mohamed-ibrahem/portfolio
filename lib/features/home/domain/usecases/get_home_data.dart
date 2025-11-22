import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/home/domain/entities/home_entity.dart';
import 'package:portfolio/features/home/domain/repositories/home_repository.dart';

class GetHomeData implements UseCase<HomeEntity, NoParams> {
  final HomeRepository repository;

  GetHomeData(this.repository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams params) async {
    return await repository.getHomeData();
  }
}
