import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/models/about_model.dart';

abstract class AboutRemoteDataSource {
  Future<AboutModel> getAbout();
}

class AboutRemoteDataSourceImpl implements AboutRemoteDataSource {
  final FirebaseFirestore _firestore;

  AboutRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<AboutModel> getAbout() async {
    try {
      final doc = await _firestore.collection('profile').doc('about').get();
      if (doc.exists && doc.data() != null) {
        return AboutModel.fromJson(doc.data()!);
      }
      throw Exception('About data not found');
    } catch (e) {
      debugPrint('Error fetching about data: $e');
      rethrow;
    }
  }
}
