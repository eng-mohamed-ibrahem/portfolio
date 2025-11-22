import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';
import 'package:portfolio/features/skills/domain/repositories/skill_repository.dart';

class GetSkills implements UseCase<List<SkillEntity>, NoParams> {
  final SkillRepository repository;

  GetSkills(this.repository);

  @override
  Future<Either<Failure, List<SkillEntity>>> call(NoParams params) async {
    return await repository.getSkills();
  }
}
