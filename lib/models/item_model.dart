class ItemModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String difficulty;
  final List<String> tags;
  final int duration;
  final String profileImage;
  final String profileName;

  const ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.difficulty,
    required this.tags,
    required this.duration,
    required this.profileImage,
    required this.profileName,
  });

  factory ItemModel.fromJson(String id, Map<String, dynamic> json) {
    return ItemModel(
      id: id,
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      difficulty: json['difficulty'],
      tags: List<String>.from(json['tags']),
      duration: json['duration'],
      profileImage: json['profileImage'] ?? '',
      profileName: json['profileName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'difficulty': difficulty,
      'tags': tags,
      'duration': duration,
      'profileImage': profileImage,
      'profileName': profileName,
    };
  }
}
