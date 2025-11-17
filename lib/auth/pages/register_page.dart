import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/auth/widgets/register_email_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            RegisterEmailFormWidget(),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                context.goNamed(AppRoutes.login.name);
              },
              child: Text("Ir a la Pagina de Login"),
            ),
          ],
        ),
      ),
    );
  }
}
