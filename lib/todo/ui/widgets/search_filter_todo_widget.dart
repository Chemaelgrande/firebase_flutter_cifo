import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterTodoWidget extends StatelessWidget {
  const SearchFilterTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Buscar Tareas....',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),

          onChanged: (value) {
            print("onChanged");
            context.read<TodoListCubit>().searchTodo(value);
          },
          onSubmitted: (value) {
            print("OnSubmitted");
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterButton(todo: Filter.all),
            FilterButton(todo: Filter.active),
            FilterButton(todo: Filter.completed),
          ],
        ),
      ],
    );
  }
}
