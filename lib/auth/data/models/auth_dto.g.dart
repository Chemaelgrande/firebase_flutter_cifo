// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => AuthDto(
  idUser: json['idUser'] as String,
  isAnonymous: json['isAnonymous'] as bool?,
);

Map<String, dynamic> _$AuthDtoToJson(AuthDto instance) => <String, dynamic>{
  'idUser': instance.idUser,
  'isAnonymous': instance.isAnonymous,
};
