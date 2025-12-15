import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/models/experience_model.dart';

abstract class ExperienceRemoteDataSource {
  Future<List<ExperienceModel>> getExperiences();
  Future<ExperienceModel?> getExperienceById(String id);
}

class ExperienceRemoteDataSourceImpl implements ExperienceRemoteDataSource {
  final FirebaseFirestore _firestore;

  ExperienceRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('experience');

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    try {
      final experiences = await _collection.get();
      return experiences.docs
          .map((doc) => ExperienceModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<ExperienceModel?> getExperienceById(String id) async {
    try {
      final doc = await _collection.doc(id).get();
      if (!doc.exists) return null;
      final data = doc.data()!;
      data['id'] = doc.id;
      return ExperienceModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to fetch experience: $e');
    }
  }
}
