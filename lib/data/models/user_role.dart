// enum UserRole {
//   @JsonValue("basic")
//   BASIC,
//   @JsonValue("manager")
//   MANAGER,
//   @JsonValue("admin")
//   ADMIN,
// }

// String toJson() => name;
// static UserRole fromJson(String json) => values.byName(json);

enum UserRole {
  basic,
  manager,
  admin;

  String toJson() => name;
  static UserRole fromJson(String json) => values.byName(json);
}
