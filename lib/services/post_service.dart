import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training/models/post.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    debugPrint('GET Posts: in progress...');
    if (response.statusCode == 200) {
      final _postList = (json.decode(response.body) as List)
          .map((i) => Post.fromJson(i))
          .toList();
      debugPrint('GET Posts: success!');
      return _postList;
    } else {
      debugPrint('GET Posts: failed');
      throw Exception('Failed to load');
    }
  }
}
