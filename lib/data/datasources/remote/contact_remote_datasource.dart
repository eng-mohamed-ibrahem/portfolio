import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/models/contact_model.dart';

abstract class ContactRemoteDataSource {
  Future<ContactModel> getContact();
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  final FirebaseFirestore _firestore;

  ContactRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<ContactModel> getContact() async {
    try {
      final doc = await _firestore.collection('profile').doc('contact').get();
      if (doc.exists && doc.data() != null) {
        return ContactModel.fromJson(doc.data()!);
      }
      throw Exception('Contact data not found');
    } catch (e) {
      debugPrint('Error fetching contact data: $e');
      rethrow;
    }
  }
}
