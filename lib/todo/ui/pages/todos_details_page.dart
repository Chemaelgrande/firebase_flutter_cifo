import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_state.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoDetailsObject {
  final TodoDto? todoDto;

  TodoDetailsObject({required this.todoDto});
}

class TodosDetailsPage extends StatelessWidget {
  // final TodoDetailsObject todoDetailsObject;
  const TodosDetailsPage({
    super.key,

    // required this.todoDetailsObject
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Text(state.selectedTodo?.desc ?? '')),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        );
      },
    );
  }
}
