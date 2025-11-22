import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/home/domain/entities/home_entity.dart';
import 'package:portfolio/features/home/domain/usecases/get_home_data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeData getHomeData;

  HomeCubit({required this.getHomeData}) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    final failureOrHomeEntity = await getHomeData(NoParams());
    failureOrHomeEntity.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (homeEntity) => emit(HomeLoaded(homeEntity: homeEntity)),
    );
  }
}
