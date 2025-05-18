import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class PostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _postscrenState();
}

class _postscrenState extends State<PostScreen> {
  Future<PostDataModel> getPosts() async {
    String baseUrl = "https://dummyjson.com/posts";
    var response = await http.get(Uri.parse(baseUrl));
    return PostDataModel.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8a44c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Posts",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getPosts(),
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text(snap.error.toString()));
            }
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data!.posts.length,
                itemBuilder: (_, index) {
                  return Card(
                    shadowColor: Colors.grey,
                    color: Color(0xfffdeeb7),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snap.data!.posts[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            snap.data!.posts[index].body,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.thumb_up_alt_outlined),
                                  SizedBox(width: 1),
                                  Text(
                                    "Likes: ${snap.data!.posts[index].reactions.likes}",
                                  ),
                                  SizedBox(width: 2),
                                  Icon(Icons.thumb_down_alt_outlined),
                                  SizedBox(width: 1),
                                  Text(
                                    "Dislikes: ${snap.data!.posts[index].reactions.dislikes}",
                                  ),
                                  SizedBox(width: 2),
                                  Icon(Icons.remove_red_eye_outlined),
                                  SizedBox(width: 1),
                                  Text(
                                    "Views: ${snap.data!.posts[index].views}",
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Wrap(
                                spacing: 5.0,
                                children:
                                    snap.data!.posts[index].tags.map((tag) {
                                      return Chip(
                                        label: Text(
                                          tag,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
