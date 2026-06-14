import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> posts = [];
  bool isLoading = true;
  String errorMsg = "";

  Future<void> getData() async{
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      try{
        final result = await http.get(uri);
        if(result.statusCode == 200){
          setState(() {
            posts = jsonDecode(result.body);
            isLoading = false;
          });
        }else{
          errorMsg = "Failed to Fetch Posts!";
          isLoading = false;
        }

      }catch(e){
        errorMsg = 'Something Went Wrong!';
        isLoading = false;
      }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:
      isLoading ? Center (child: CircularProgressIndicator()):
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    return Card(
                      elevation: 4, // Adds a subtle shadow depth beneath the card
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: const Color(0xFF1A1A1A), // Sleek, dark charcoal background matrix
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Smoothly rounded corners
                        side: const BorderSide(color: Colors.red, width: 1.5), // Sharp crimson accent frame border
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0), // Consistent internal padding
                        child: Row(
                          children: [
                            // 1. Sleek ID Badge Container (Replaced the inner Card)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.red[900], // Muted dynamic crimson tone
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${post['id']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16), // Balanced visual spacing divider

                            // 2. Main Content Column Block (Wrapped in Expanded to stop horizontal crashes)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Dynamic Title Header
                                  Text(
                                    '${post['title']}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis, // Clean layout truncation tail
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800, // Bold heavy text weight
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  // Dynamic Body Data Payload
                                  Text(
                                    '${post['body']}',
                                    maxLines: 2, // Gives the description text room to breathe
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.3,
                                      color: Colors.grey[400], // Softer contrast tone for long reading blocks
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: (){}),
                        FloatingActionButton(child: Icon(Icons.auto_fix_normal),
                        onPressed: (){}),
                        FloatingActionButton(child: Icon(Icons.auto_fix_high),
                        onPressed: (){}),
                        FloatingActionButton(child: Icon(Icons.delete),
                      onPressed: (){}),
                  ],
                ),
              )
            ],
          )
      
    );
  }
}
