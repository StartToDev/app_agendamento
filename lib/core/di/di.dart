import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/auth_datasource.dart';
import '../../features/auth/data/auth_repository.dart';

final getIt = GetIt.I;

Future<void> configureDependencies() async {
  getIt.registerSingleton(Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'b5Oz15zjWOMA0nvO8XdOv7GEsvLuVtMr6tArjKVZ',
        'X-Parse-REST-API-Key': 'a0rNcINrx8UYQbXnaS5qRTPQy2XNkQAuvG5DXPWd'
        // 'X-Parse-Session-Token': 'r:5ad07c1046a8ba3fd8f309c9a513a13a'
      },
    ),
  )..interceptors.addAll([
      // if dev....colocar teste aqui
      PrettyDioLogger(requestHeader: true, requestBody: true),
    ]));

  final preferences = await SharedPreferences.getInstance();

  getIt.registerSingleton(preferences);

  getIt.registerFactory<AuthDatasource>(() => RemoteAuthDatasource(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt(), getIt()));
}

//aqui 1:05 ok