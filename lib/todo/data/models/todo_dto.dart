import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_dto.g.dart';

Uuid uuid = Uuid();

enum Filter { all, active, completed }

@JsonSerializable()
class TodoDto {
  final String id;
  final String? idUser;
  final String desc;
  final bool completed;

  TodoDto({String? id, this.idUser, required this.desc, this.completed = false})
    : id = id ?? uuid.v4();

  /// Connect the generated [_$TodoFromJson] function to the `fromJson`
  /// factory.
  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  /// Connect the generated [_$TodoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);
}
