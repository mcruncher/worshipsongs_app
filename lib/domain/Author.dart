class Author {
  int id;
  String? firstName = "";
  String? lastName = "";
  String displayName = "";

  Author({required this.id, this.firstName, this.lastName, required this.displayName});

  factory Author.fromMap(Map<String, dynamic> json) => Author(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      displayName: json["display_name"],
  );
}