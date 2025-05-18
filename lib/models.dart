class ReactionsModel {
  int dislikes;
  int likes;

  ReactionsModel({required this.dislikes, required this.likes});

  factory ReactionsModel.fromJson(Map<String, dynamic> json) {
    return ReactionsModel(dislikes: json['dislikes'], likes: json['likes']);
  }
}

class PostModel {
  String body;
  int id;
  ReactionsModel reactions;
  List<String> tags;
  String title;
  int userId;
  int views;

  PostModel({
    required this.body,
    required this.id,
    required this.reactions,
    required this.tags,
    required this.title,
    required this.userId,
    required this.views,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'],
      id: json['id'],
      reactions: ReactionsModel.fromJson(json["reactions"]),
      tags: List<String>.from(json['tags']),
      title: json['title'],
      userId: json['userId'],
      views: json['views'],
    );
  }
}

class PostDataModel {
  List<PostModel> posts;
  int total;
  int skip;
  int limit;

  PostDataModel({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    List<PostModel> pData = (json["posts"] as List).map((post) => PostModel.fromJson(post)).toList();

    return PostDataModel(
      posts: pData,
      total: json['total'],
      skip: json["skip"],
      limit: json['limit'],
    );
  }
}
