import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntialPage extends StatelessWidget {
  const IntialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>()..init(),
      listener: (context, state) {
        if (state.isLoged == true) {
          return context.goNamed(AppRoutes.home.name);
        }

        if (state.isLoged == false) {
          return context.goNamed(AppRoutes.login.name);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              locator<StartAppCubit>().loginSesion();
            },
          ),
        );
      },
    );
  }
}
