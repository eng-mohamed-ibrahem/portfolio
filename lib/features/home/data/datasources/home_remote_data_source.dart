import 'package:portfolio/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    // TODO: Implement Firebase logic
    return Future.value(
      const HomeModel(
        name: 'Mohamed Ibrahem',
        title: 'Flutter Developer',
        summary: 'I am a passionate Flutter developer with a strong focus on creating beautiful and high-performance applications.',
      ),
    );
  }
}
