class Category {
  int id;
  String name;
  String description;

  Category({
    this.id,
    this.name,
    this.description,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  static Map<String, dynamic> toJson(Category category) {
    return {
      "id": category.id,
      "name": category.name,
      "category": category.description,
    };
  }
}
