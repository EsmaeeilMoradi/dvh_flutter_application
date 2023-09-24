class ContentSort {
  static const String latestVideos = "filters[type][slug]=videos&populate=author";
  static const String latestPodcasts = "filters[type][slug]=podcasts&populate=author";
  static const String latestSourcecode = "filters[type][slug]=repositories&populate=author";
}

class ContentEntity {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final int price;
  final String description;
  // final int? viewCount;
  // final String? author;

  ContentEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        publishedAt = json['publishedAt'],
        price = 0,
        description = json['description'];
        // viewCount = json['viewCount'],
        // author = json['author'];
}
