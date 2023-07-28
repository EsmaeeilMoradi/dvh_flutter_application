import 'package:dio/dio.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/source/content_data_source.dart';

final httpClient = Dio(BaseOptions(baseUrl: 'http://DVHURL.com/api/v?/'));


final contentRepository =
    ContentRepository(ContentRemoteDataSource(httpClient));

abstract class IContentRepository {
  Future<List<ContentEntity>> getAll(int sort);
  Future<List<ContentEntity>> search(String searchTerm);
}

class ContentRepository implements IContentRepository {
  final IContentDataSource dataSource;

  ContentRepository(this.dataSource);

  @override
  Future<List<ContentEntity>> getAll(int sort) => dataSource.getAll(sort);

  @override
  Future<List<ContentEntity>> search(String searchTerm) =>
      dataSource.search(searchTerm);
}
