import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue("basic")
  basic,
  @JsonValue("manager")
  manager,
  @JsonValue("admin")
  admin;

  // String toJson() => name;
  // static UserRole fromJson(String json) => values.byName(json);
}
