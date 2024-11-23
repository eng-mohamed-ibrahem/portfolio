import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/model/message_model/message_model.dart';

part 'contact_viewmodel_state.dart';

class ContactViewmodel extends Cubit<ContactViewmodelState> {
  ContactViewmodel() : super(ContactViewmodelInitial());

  void sendMessage(MessageModel message) async {
    emit(SendMessageLoadingState());

    try {
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': 'service_ghu8t4c',
          'template_id': 'template_6aunamf',
          'user_id': 'hz_Ugnjx2G1hFD8DD',
          'template_params': {
            'user_name': message.name, // Sender's name
            'user_email': message.email, // Sender's email
            'user_message': message.message, // The message
            'to_email':
                "${message.email},mohamed.data13@gmail.com", // Specific user to receive the email
          },
        }),
      );
      if (response.statusCode == 200) {
        emit(SendMessageSuccessState());
      } else {
        emit(SendMessageErrorState("Failed to send email."));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(SendMessageErrorState(e.toString()));
    }
  }
}
