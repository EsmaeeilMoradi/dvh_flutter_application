class ContentSort {
  static const String latestVideos = "video";
  static const String latestPodcasts = "podcast";
  static const String latestSourcecode = "repo";
}

class ContentEntity {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final int price;
  final String description;
  final int? viewCount;
  final String? author;

  ContentEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        publishedAt = json['publishedAt'],
        price = json['price'],
        description = json['description'],
        viewCount = json['viewCount'],
        author = json['author'];
}
