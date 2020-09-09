// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return Questions(
    structure: json['structure'] == null
        ? null
        : Structure.fromJson(json['structure'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'structure': instance.structure?.toJson(),
    };

Structure _$StructureFromJson(Map<String, dynamic> json) {
  return Structure(
    kind: json['kind'] as String,
    query: json['query'] == null
        ? null
        : Query.fromJson(json['query'] as Map<String, dynamic>),
    options: json['options'] as List,
    answer: json['answer'] as int,
  );
}

Map<String, dynamic> _$StructureToJson(Structure instance) => <String, dynamic>{
      'kind': instance.kind,
      'query': instance.query?.toJson(),
      'options': instance.options,
      'answer': instance.answer,
    };
