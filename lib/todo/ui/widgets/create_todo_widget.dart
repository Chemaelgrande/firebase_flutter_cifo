import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodoWidget extends StatelessWidget {
  const CreateTodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text("¿Qué quieres hacer?")),
      onSubmitted: (value) {
        context.read<TodoListCubit>().addTodo(value);
      },
    );
  }
}
