class ContentSort {
  static const int latestVideos = 0;
  static const int latestPodcasts = 1;
  static const int latestSourcecode = 2;
}

class ContentEntity {
  final int id;
  final String title;
  final String imageUrl;
  final int view;

  ContentEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image'],
        view = json['view'];
}
