import 'package:equatable/equatable.dart';

class Information extends Equatable {
  final String titleAr;
  final String descriptionAr;
  final String titleEn;
  final String descriptionEn;

  const Information({required this.titleAr, required this.descriptionAr, required this.titleEn, required this.descriptionEn});
  
  @override
  List<Object?> get props => [titleAr, descriptionAr, titleEn, descriptionEn];
}
