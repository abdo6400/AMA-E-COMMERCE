import '../../domain/entities/information.dart';

class InformationModel extends Information {
  const InformationModel({required super.titleAr, required super.descriptionAr,required super.titleEn, required super.descriptionEn});

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      titleAr: json['titleAr'],
      descriptionAr: json['descriptionAr'],
      titleEn: json['titleEn'],
      descriptionEn: json['descriptionEn'],
    );
  }
}
