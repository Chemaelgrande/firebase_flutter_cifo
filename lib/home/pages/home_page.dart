import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/auth/data/repository/auth_firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          locator<StartAppCubit>().logOutSesion();
        },
      ),
    );
  }
}
