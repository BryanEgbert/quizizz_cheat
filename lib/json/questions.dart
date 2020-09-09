import 'package:json_annotation/json_annotation.dart';
import 'questions_data/questions_quiz.dart';

part 'questions.g.dart';

@JsonSerializable(explicitToJson: true)
class CoreData {
  QuestionData data;

  CoreData({this.data});

  factory CoreData.fromJson(Map<String, dynamic> json) => _$CoreDataFromJson(json);
  Map<String, dynamic> toJson() => _$CoreDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionData {
  Quiz quiz;

  QuestionData({this.quiz});

  factory QuestionData.fromJson(Map<String, dynamic> json) => _$QuestionDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
