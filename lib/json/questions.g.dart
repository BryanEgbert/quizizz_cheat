// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreData _$CoreDataFromJson(Map<String, dynamic> json) {
  return CoreData(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : QuestionData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoreDataToJson(CoreData instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
    };

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) {
  return QuestionData(
    quiz: json['quiz'] == null
        ? null
        : Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'quiz': instance.quiz?.toJson(),
    };
