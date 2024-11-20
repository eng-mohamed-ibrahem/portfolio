part of 'main_viewmodel.dart';

abstract class MainViewModelState {}

class MainViewModelInitial extends MainViewModelState {}

class SelectedTab extends MainViewModelState {
  final int tabIndex;
  SelectedTab(this.tabIndex);
}
