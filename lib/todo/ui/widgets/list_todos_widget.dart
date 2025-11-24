import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:firebase_flutter_cifo/todo/ui/utils/background_dismissible.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTodosWidget extends StatelessWidget {
  final List<TodoDto> todos;
  const ListTodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(todos[index].id),
          onDismissed: (_) {
            locator<TodoListCubit>().removeTodo(todos[index]);
          },
          confirmDismiss: (_) {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("¿Estas seguro de querer realizar borrar?"),
                  content: Text("Esta acción es permanente"),

                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text("SI"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text("NO"),
                    ),
                  ],
                );
              },
            );
          },
          background: BackgroundDismissible(direction: 0),
          secondaryBackground: BackgroundDismissible(direction: 1),
          child: TodoItemWidget(
            desc: todos[index].desc,
            isCompleted: todos[index].completed,
            id: todos[index].id,

            todoDto: todos[index],
          ),
        );
      },
    );
  }
}
