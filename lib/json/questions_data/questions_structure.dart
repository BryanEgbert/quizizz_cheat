import 'package:json_annotation/json_annotation.dart';

part 'questions_structure.g.dart';

@JsonSerializable(explicitToJson: true)
class Query {
  String text;
  List<Images> media;
  @JsonKey(nullable: true)
  bool hasMath;
  @JsonKey(nullable: true)
  Math math;

  Query({this.text, this.media, this.hasMath, this.math});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true, nullable: true)
class Math {
  List<String> latex;
  String template;

  Math({this.latex, this.template});

  factory Math.fromJson(Map<String, dynamic> json) => _$MathFromJson(json);
  Map<String, dynamic> toJson() => _$MathToJson(this);
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
  String type;
  bool hasMath;
  List<dynamic> media;
  String text;

  QuestionText({this.type, this.hasMath, this.media, this.text});

  factory QuestionText.fromJson(Map<String, dynamic> json) =>
      _$QuestionTextFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTextToJson(this);
}
