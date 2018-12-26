import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()

class Repo {
  Repo(this.id, this.name, this.fullName);

  int id;
  String name;
  @JsonKey(name: 'full_name')
  String fullName;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}