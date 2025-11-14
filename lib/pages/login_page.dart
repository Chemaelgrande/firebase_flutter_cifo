import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/widgets/login_email_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            LoginEmailFormWidget(),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                context.goNamed(AppRoutes.register.name);
              },
              child: Text("Ir a la pagina de Registro"),
            ),
          ],
        ),
      ),
    );
  }
}
