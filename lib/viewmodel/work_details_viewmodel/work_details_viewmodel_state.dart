part of 'work_details_viewmodel.dart';

abstract class WorkDetailsViewModelState {}

class WorkDetailsViewModelInitial extends WorkDetailsViewModelState {}

class ChangeStateOfYoutubePlayer extends WorkDetailsViewModelState {
  ChangeStateOfYoutubePlayer({
    required this.isPlaying,
  });
  final bool isPlaying;
}
