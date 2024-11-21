part of 'contact_viewmodel.dart';

abstract class ContactViewmodelState {}

class ContactViewmodelInitial extends ContactViewmodelState {}

class SendMessageState extends ContactViewmodelState {}

class SendMessageLoadingState extends ContactViewmodelState {}

class SendMessageSuccessState extends ContactViewmodelState {}

class SendMessageErrorState extends ContactViewmodelState {
  final String message;

  SendMessageErrorState(this.message);
}
