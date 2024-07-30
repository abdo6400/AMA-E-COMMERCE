import '../../domain/entities/ad.dart';

class AdModel extends Ad {
  AdModel({
    required super.id,
    required super.link,
    required super.image,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      link: json['link'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'link': link,
      'image': image,
    };
  }
}
