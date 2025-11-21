import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/core/router/app_router.dart';
import 'package:firebase_flutter_cifo/helpers/validators_form.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterEmailFormWidget extends StatelessWidget {
  RegisterEmailFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ValidatorsForm validatorsForm = ValidatorsForm();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repeatPasswordController = TextEditingController();
    return BlocBuilder<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>(),
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Introduzca el Email"),
                validator: validatorsForm.isValidEmail,
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: passwordController,
                obscureText: state.isObscureTextPassRegister,
                decoration: InputDecoration(
                  hintText: "Introduzca su contraseña",
                  suffixIcon: IconButton(
                    onPressed: () {
                      locator<StartAppCubit>().toggleShowRegisterPass();
                    },
                    icon: Icon(
                      (state.isObscureTextPassRegister == true)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: validatorsForm.isValidPass,
              ),
              SizedBox(height: 50),
              TextFormField(
                obscureText: state.isObscureTextRepeatPassRegister,
                controller: repeatPasswordController,
                decoration: InputDecoration(
                  hintText: "Repita su contraseña",
                  suffixIcon: IconButton(
                    onPressed: () {
                      locator<StartAppCubit>().toggleShowRegisterRepeatPass();
                    },
                    icon: Icon(
                      (state.isObscureTextRepeatPassRegister == true)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: validatorsForm.isValidPass,
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  // context.goNamed(AppRoutes.home.name);
                  if (_formKey.currentState!.validate()) {
                    if (passwordController.value ==
                        repeatPasswordController.value) {
                      locator<StartAppCubit>().signUpWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Las Contraseñas NO son igules"),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
