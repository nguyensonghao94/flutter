import 'package:todo/constants/config.dart';

class TodoModel {
  int id;
  String title;
  String description;
  int status;
  String createdAt;
  String image;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.image
  });

  String getImage() {
    return "${API_URL}${this.image}";
  }
}