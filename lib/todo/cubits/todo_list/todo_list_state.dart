import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:firebase_flutter_cifo/todo/data/utils/data.mock.dart';

class TodoListState {
  final List<TodoDto> todos;
  final List<TodoDto> todosFiltered;
  final Filter selectedFilter;
  final int activeTodoCount;
  final TodoDto? selectedTodo;

  TodoListState({
    required this.todos,
    required this.activeTodoCount,
    required this.todosFiltered,
    required this.selectedFilter,
    required this.selectedTodo,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todos: [],
      activeTodoCount: 0,
      todosFiltered: [],
      selectedFilter: Filter.all,
      selectedTodo: null,
    );
  }

  TodoListState copyWith({
    List<TodoDto>? todos,
    int? activeTodoCount,
    List<TodoDto>? todosFiltered,
    Filter? selectedFilter,
    TodoDto? selectedTodo,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
      todosFiltered: todosFiltered ?? this.todosFiltered,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedTodo: selectedTodo ?? this.selectedTodo,
    );
  }
}
