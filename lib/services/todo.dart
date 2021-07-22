import 'dart:async';
import 'package:dio/dio.dart';
import 'package:todo/services/client.dart';

import '../models/todo.dart';

class TodoService {
  static Future<List<TodoModel>> getList() async {
    List<TodoModel> list = [];
    const String url = '/todo/list';    
    final http = Client().init();
    final response = await http.get(url);
    final data = response.data['data'];
    data.forEach((item) {
      list.add(TodoModel(
        id: item['id'], 
        title: item['title'], 
        image: item['image'],
        status: 1,
        createdAt: item['created_at'],
      ));
    });

    return list;
  }

  static Future<TodoModel> add(title, description, image) async {
    const String url = '/todo/add';
    final formData = FormData.fromMap({
      'title': title,
      'description': description,
      'image': await MultipartFile.fromFile(image.path, filename: "test.png")
    });

    final http = Client().init();
    final response = await http.post(
      url,      
      data: formData
    );

    final data = response.data['data'];
    return TodoModel(
      id: data['id'], 
      title: data['title'], 
      status: 1,
      image: data['image'],
      createdAt: data['created_at']
    );
  }

  static Future<dynamic> remove(String id) async {
    String url = "/todo/" + id;
    final http = Client().init();
    final response = await http.delete(url);
    final data = response.data['data'];
    return data;
  }
}