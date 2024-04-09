import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());

  initialize();
}

Future<void> initialize() async {
  final AuthRepository authRepository = AuthRepository();

  final result = await authRepository.login(email: 'teste@gmail.com', password: '12345');
  switch (result) {
    case Success(object: final user):
      print('success: ${user.id}');
    case Failure(error: final error):
      print('app: $error');
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
