import '../../domain/entities/offer.dart';

class OfferModel extends Offer {
  OfferModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.image,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }
}
