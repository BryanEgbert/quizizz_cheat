import 'package:json_annotation/json_annotation.dart';
import 'questions_structure.dart';

part 'questions_info.g.dart';

@JsonSerializable(explicitToJson: true)
class Questions {
  Structure structure;

  Questions({this.structure});

  factory Questions.fromJson(Map<String, dynamic> json) => _$QuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Structure {
  String kind;
  Query query;
  List<dynamic> options;
  int answer;

  Structure({this.kind, this.query, this.options, this.answer});

  factory Structure.fromJson(Map<String, dynamic> json) => _$StructureFromJson(json);
  Map<String, dynamic> toJson() => _$StructureToJson(this);
}