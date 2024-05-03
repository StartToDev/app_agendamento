import 'package:app_agendamento/features/auth/data/auth_datasource.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/result.dart';
import '../models/user.dart';

class AuthRepository {
  AuthRepository(this._datasource, this._preferences);

  final AuthDatasource _datasource;
  final SharedPreferences _preferences;

  User? user;

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    final result = await _datasource.login(email: email, password: password);

    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }
}