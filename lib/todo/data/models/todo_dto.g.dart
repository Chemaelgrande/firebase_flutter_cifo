// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) => TodoDto(
  id: json['id'] as String?,
  idUser: json['idUser'] as String?,
  desc: json['desc'] as String,
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$TodoDtoToJson(TodoDto instance) => <String, dynamic>{
  'id': instance.id,
  'idUser': instance.idUser,
  'desc': instance.desc,
  'completed': instance.completed,
};
