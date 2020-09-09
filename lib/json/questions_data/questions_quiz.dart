import 'package:json_annotation/json_annotation.dart';
import 'questions_info.dart';

part 'questions_quiz.g.dart';

@JsonSerializable(explicitToJson: true)
class Quiz {
  String publishedVersion;
  @JsonKey(name: '_id')
  String id;
  Stats stats;
  CreatedBy createdBy;
  Info info;

  Quiz({this.publishedVersion, this.id, this.stats, this.createdBy, this.info});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatedBy {
  Local local;
  String occupation;

  CreatedBy({this.local, this.occupation});

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Local {
  String username;

  Local({this.username});

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);
  Map<String, dynamic> toJson() => _$LocalToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Stats {
  int played;
  int totalPlayers;

  Stats({this.played, this.totalPlayers});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Info {
  String name;
  String image;
  List<String> subjects, topics, subtopics;
  List<Questions> questions;

  Info({
      this.name,
      this.image,
      this.subjects,
      this.topics,
      this.subtopics,
      this.questions});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}