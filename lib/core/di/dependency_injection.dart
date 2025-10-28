import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
