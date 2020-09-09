import 'package:json_annotation/json_annotation.dart';

part 'questions_structure.g.dart';

@JsonSerializable(explicitToJson: true)
class Query {
  String text;
  List<Images> media;

  Query({this.text, this.media});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Images {
  String url;
  
  Images({this.url});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionText {
  Map<String, Object> math;
  String type;
  bool hasMath;
  List<dynamic> media;
  String text;

  QuestionText({this.math, this.type, this.hasMath, this.media,this.text});

  factory QuestionText.fromJson(Map<String, dynamic> json) => _$QuestionTextFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTextToJson(this);
}