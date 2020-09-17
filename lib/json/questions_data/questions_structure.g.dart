// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    text: json['text'] as String,
    media: (json['media'] as List)
        ?.map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasMath: json['hasMath'] as bool,
    math: json['math'] == null
        ? null
        : Math.fromJson(json['math'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'text': instance.text,
      'media': instance.media?.map((e) => e?.toJson())?.toList(),
      'hasMath': instance.hasMath,
      'math': instance.math?.toJson(),
    };

Math _$MathFromJson(Map<String, dynamic> json) {
  return Math(
    latex: (json['latex'] as List)?.map((e) => e as String)?.toList(),
    template: json['template'] as String,
  );
}

Map<String, dynamic> _$MathToJson(Math instance) => <String, dynamic>{
      'latex': instance.latex,
      'template': instance.template,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'url': instance.url,
    };

QuestionText _$QuestionTextFromJson(Map<String, dynamic> json) {
  return QuestionText(
    type: json['type'] as String,
    hasMath: json['hasMath'] as bool,
    media: json['media'] as List,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$QuestionTextToJson(QuestionText instance) =>
    <String, dynamic>{
      'type': instance.type,
      'hasMath': instance.hasMath,
      'media': instance.media,
      'text': instance.text,
    };
