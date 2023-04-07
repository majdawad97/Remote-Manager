enum UserRole {
  // @JsonValue("basic")
  customer,
  // @JsonValue("manager")
  manager,
  // @JsonValue("admin")
  admin;

  String toJson() => name;
  static UserRole fromJson(String json) => values.byName(json);
}
