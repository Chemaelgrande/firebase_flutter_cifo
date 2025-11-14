import 'dart:async';

import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/pages/home_page.dart';
import 'package:firebase_flutter_cifo/pages/intial_page.dart';
import 'package:firebase_flutter_cifo/pages/login_page.dart';
import 'package:firebase_flutter_cifo/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes { login, register, home, initial }

final useBloc = locator<StartAppCubit>();

final goRouter = GoRouter(
  refreshListenable: GoRouterRefreshStream(useBloc.stream),
  debugLogDiagnostics: true,
  redirect: (context, state) {
    if (useBloc.state.isLoged == true) {
      return '/home';
    } else {
      return '/login';
    }
  },
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.initial.name,
      builder: (context, state) {
        return IntialPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: AppRoutes.login.name,
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      name: AppRoutes.register.name,
      builder: (context, state) {
        return RegisterPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return HomePage();
      },
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
