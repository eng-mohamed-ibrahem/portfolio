import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/model/work_model/work_model.dart';

part 'work_details_viewmodel_state.dart';

class WorkDetailsViewModel extends Cubit<WorkDetailsViewModelState> {
  WorkDetailsViewModel() : super(WorkDetailsViewModelInitial());

  WorkModel? currentWorkDetails;

  void changeStateOfYoutubePlayer({bool isPlaying = false}) {
    emit(ChangeStateOfYoutubePlayer(isPlaying: isPlaying));
  }
}
