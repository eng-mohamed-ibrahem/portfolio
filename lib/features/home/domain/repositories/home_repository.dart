import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
