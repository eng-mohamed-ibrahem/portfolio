import 'package:get_it/get_it.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';

GetIt _getIt = GetIt.instance;

void setUpDepdencies() {
  _getIt.registerSingleton(RuntimeCache.instance());
}
