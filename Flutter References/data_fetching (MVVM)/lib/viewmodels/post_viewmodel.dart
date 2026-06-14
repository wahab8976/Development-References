
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:data_fetching/models/post_model.dart';

class PostViewmodel {
  final baseURL = "https://jsonplaceholder.typicode.com/posts";
  List<PostModel> posts = [];

  // Fetch All posts
  Future<List<PostModel>> fetchAllPosts() async {
    final parsedUri = Uri.parse(baseURL);

    try{
      final response = await http.get(parsedUri);
      if(response.statusCode == 200){
        final List<dynamic> rawJson = jsonDecode(response.body);
        // Get all posts and pass to Constructor
        posts = rawJson.map((post) => PostModel.fromJSON(post)).toList();

        return posts;
      }else{
        throw Exception("Server returned failure status code: ${response.statusCode}");
      }
    }catch(e){
       throw Exception("Network or JSON parsing crash: $e");
    }
  }


}