import 'package:portfolio/features/home/data/models/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    final snapshot = await FirebaseFirestore.instance.collection('profile').doc('data').get();
    final profileData = snapshot.data();
    return HomeModel.fromJson(profileData!);
  }
}
