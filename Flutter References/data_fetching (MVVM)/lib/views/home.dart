import 'dart:convert';

import 'package:data_fetching/viewmodels/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final postViewModel = PostViewmodel();
  bool isLoading = true;
  String errorMsg = "";

  Future<void> loadData() async {
    try {
      await postViewModel.fetchAllPosts();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMsg = "Failed to sync feed items!"; // Caches the failure message parameters
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("API Control Panel"),
        backgroundColor: const Color(0xFF1A1A1A),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.red))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postViewModel.posts.length > 10 ? 10 : postViewModel.posts.length, // Capped at 10 for safe layout tracking
              itemBuilder: (context, index) {
                final post = postViewModel.posts[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column( // Changed outer child structure to a Column to stack the action bar underneath the content
                      children: [
                        Row(
                          children: [
                            // Sleek ID Badge Container
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${post.id}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            const SizedBox(width: 16), // Spacing block

                            // 2. Main Content Block
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${post.title}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${post.body}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.3,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        const Divider(color: Colors.grey, height: 1), // Inline separator line

                        // ==========================================
                        // NEW PER-POST ACTION DOCK BAR
                        // ==========================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // PUT Button (Full Replace Simulation)
                            IconButton(
                              icon: const Icon(Icons.auto_fix_normal, color: Colors.teal, size: 20),
                              tooltip: 'PUT (Full Replace)',
                              onPressed: () {
                                // Call your promptPutDialog method directly passing the absolute index loop context
                                // promptPutDialog(index);
                              },
                            ),
                            // PATCH Button (Partial Title Modify Simulation)
                            IconButton(
                              icon: const Icon(Icons.auto_fix_high, color: Colors.orange, size: 20),
                              tooltip: 'PATCH (Modify Title)',
                              onPressed: () {
                                // promptPutDialog(index);
                              },
                            ),
                            // DELETE Button (Remove Element)
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20),
                              tooltip: 'DELETE',
                              onPressed: () {
                                // promptPutDialog(index);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Section now only holds a unified Create Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("CREATE NEW POST (POST)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {
                // promptPutDialog(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

