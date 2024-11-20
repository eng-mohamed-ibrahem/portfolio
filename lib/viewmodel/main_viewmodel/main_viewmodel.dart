import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_viewmodel_state.dart';

class MainViewmodel extends Cubit<MainViewModelState> {
  MainViewmodel() : super(MainViewModelInitial());
  int currentTapIndex = 0;

  void setSelectedTab(int index) {
    currentTapIndex = index;
    emit(SelectedTab(currentTapIndex));
  }
}
