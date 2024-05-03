import 'dart:developer';

import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/core/route/app_routes.dart';

import 'package:app_agendamento/features/auth/data/auth_repository.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());

  initialize();
}

Future<void> initialize() async {
  final AuthRepository authRepository = AuthRepository(getIt(), getIt());

  final result = await authRepository.login(email: 'teste@gmail.com', password: '12345');
  switch (result) {
    case Success(object: final user):
      log('success: ${user.id}');
    case Failure(error: final error):
      log('app: $error');
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
