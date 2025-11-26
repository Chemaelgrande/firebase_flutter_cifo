import 'dart:io';

import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/helpers/validators_form.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController(
    text: locator<StartAppCubit>().state.myCurrentUser?.name ?? '',
  );
  TextEditingController secondNameController = TextEditingController(
    text: locator<StartAppCubit>().state.myCurrentUser?.secondName ?? '',
  );
  ValidatorsForm validatorsForm = ValidatorsForm();

  //Imagenes

  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();

  //Seleccionar una imagen desde cámara o galeria
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null
                        ? FileImage(File(_imageFile!.path))
                        : null,
                    child: Icon(Icons.person, size: 60),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _pickImage(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera_alt),
                          label: Text("Cámara"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.photo_library),
                          label: Text("Galeria"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.photo_library),
                    label: Text("Subir a Cloud Storage"),
                  ),
                  SizedBox(height: 40),
                  Text("Nombre del Usuario"),
                  TextFormField(
                    controller: nameController,
                    validator: validatorsForm.isValidName,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.name ?? 'Introduce un nombre',
                    ),
                  ),
                  SizedBox(height: 20),

                  Text("Apellido del Usuario"),
                  TextFormField(
                    readOnly: (state.myCurrentUser?.secondName == null)
                        ? false
                        : true,
                    validator: validatorsForm.isValidName,
                    controller: secondNameController,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.secondName ??
                          'Introduce tu apellido',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email del Usuario"),
                  TextFormField(
                    readOnly: (state.myCurrentUser?.eamil == null)
                        ? false
                        : true,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText:
                          state.myCurrentUser?.eamil ?? 'Introduce un email',
                    ),
                  ),

                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        locator<StartAppCubit>().editUser(
                          name: nameController.text,
                          secondName: secondNameController.text,
                        );
                        context.pop();
                      }
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
