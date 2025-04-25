import '../../domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required String id,
    required String name,
    String? imageUrl,
  }) : super(id: id, name: name, imageUrl: imageUrl);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory HomeModel.fromEntity(HomeEntity entity) {
    return HomeModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }

  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
