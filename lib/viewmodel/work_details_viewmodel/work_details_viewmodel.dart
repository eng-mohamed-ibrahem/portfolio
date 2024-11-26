import 'package:flutter_bloc/flutter_bloc.dart';

part 'work_details_viewmodel_state.dart';

class WorkDetailsViewModel extends Cubit<WorkDetailsViewModelState> {
  WorkDetailsViewModel() : super(WorkDetailsViewModelInitial());

  void changeStateOfYoutubePlayer({bool isPlaying = false}) {
    emit(ChangeStateOfYoutubePlayer(isPlaying: isPlaying));
  }
}
