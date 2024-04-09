import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/user.dart';

class AuthDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'b5Oz15zjWOMA0nvO8XdOv7GEsvLuVtMr6tArjKVZ',
        'X-Parse-REST-API-Key': 'a0rNcINrx8UYQbXnaS5qRTPQy2XNkQAuvG5DXPWd'
        // 'X-Parse-Session-Token': 'r:5ad07c1046a8ba3fd8f309c9a513a13a'
      },
    ),
  )..interceptors.addAll([
      PrettyDioLogger(requestHeader: true, requestBody: true),
    ]);

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/v1-sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return const Failure(LoginFailedResult.offline);
      } else if (e.response?.statusCode == 404) {
        return const Failure(LoginFailedResult.invalidCredentials);
      }
      return const Failure(LoginFailedResult.unknowError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknowError);
    }
  }
}
