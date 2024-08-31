import 'package:equatable/equatable.dart';

class Information extends Equatable {
  final String title;
  final String description;

  const Information({required this.title, required this.description});
  
  @override
  List<Object?> get props => [title, description];
}
