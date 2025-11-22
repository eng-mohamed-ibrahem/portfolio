import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/works/domain/entities/work_entity.dart';
import 'package:portfolio/features/works/domain/usecases/get_works.dart';

part 'works_state.dart';

class WorksCubit extends Cubit<WorksState> {
  final GetWorks getWorks;

  WorksCubit({required this.getWorks}) : super(WorksInitial());

  Future<void> fetchWorks() async {
    emit(WorksLoading());
    final failureOrWorks = await getWorks(NoParams());
    failureOrWorks.fold(
      (failure) => emit(WorksError(message: failure.message)),
      (works) => emit(WorksLoaded(works: works)),
    );
  }
}
