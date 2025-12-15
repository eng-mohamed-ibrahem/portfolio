import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/models/education_model.dart';

abstract class EducationRemoteDataSource {
  Future<List<EducationModel>> getEducation();
}

class EducationRemoteDataSourceImpl implements EducationRemoteDataSource {
  final FirebaseFirestore _firestore;

  EducationRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('education');

  @override
  Future<List<EducationModel>> getEducation() async {
    try {
      final snapshot = await _collection.orderBy('time').get();
      return snapshot.docs
          .map((doc) => EducationModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint('Error fetching education data: $e');
      rethrow;
    }
  }
}
