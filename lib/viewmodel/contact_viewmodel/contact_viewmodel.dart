import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/model/message_model/message_model.dart';

part 'contact_viewmodel_state.dart';

class ContactViewmodel extends Cubit<ContactViewmodelState> {
  ContactViewmodel() : super(ContactViewmodelInitial());

  void sendMessage(MessageModel message) {
    emit(SendMessageState());
  }
}
