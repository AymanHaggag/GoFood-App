class Recipe {
  final String? name;
  final String? images;
  final double? rating;
  final String? totalTime;
  final String? directionsUrl;

  Recipe({this.name, this.images, this.rating, this.totalTime, this.directionsUrl});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String,
        directionsUrl: json['directionsUrl'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}