// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    publishedVersion: json['publishedVersion'] as String,
    id: json['_id'] as String,
    stats: json['stats'] == null
        ? null
        : Stats.fromJson(json['stats'] as Map<String, dynamic>),
    createdBy: json['createdBy'] == null
        ? null
        : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'publishedVersion': instance.publishedVersion,
      '_id': instance.id,
      'stats': instance.stats?.toJson(),
      'createdBy': instance.createdBy?.toJson(),
      'info': instance.info?.toJson(),
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return CreatedBy(
    local: json['local'] == null
        ? null
        : Local.fromJson(json['local'] as Map<String, dynamic>),
    occupation: json['occupation'] as String,
  );
}

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'local': instance.local?.toJson(),
      'occupation': instance.occupation,
    };

Local _$LocalFromJson(Map<String, dynamic> json) {
  return Local(
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
      'username': instance.username,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    played: json['played'] as int,
    totalPlayers: json['totalPlayers'] as int,
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'played': instance.played,
      'totalPlayers': instance.totalPlayers,
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    name: json['name'] as String,
    image: json['image'] as String,
    subjects: (json['subjects'] as List)?.map((e) => e as String)?.toList(),
    topics: (json['topics'] as List)?.map((e) => e as String)?.toList(),
    subtopics: (json['subtopics'] as List)?.map((e) => e as String)?.toList(),
    questions: (json['questions'] as List)
        ?.map((e) =>
            e == null ? null : Questions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'subjects': instance.subjects,
      'topics': instance.topics,
      'subtopics': instance.subtopics,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };
