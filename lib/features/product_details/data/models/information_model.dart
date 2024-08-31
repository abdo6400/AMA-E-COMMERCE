import '../../domain/entities/information.dart';

class InformationModel extends Information {
  const InformationModel({required super.title, required super.description});

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
