import 'package:dvh_flutter_application/common/http_client.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/source/content_data_source.dart';



final contentRepository =
    ContentRepository(ContentRemoteDataSource(httpClient));

abstract class IContentRepository {
  Future<List<ContentEntity>> getAll(String sort);
  Future<List<ContentEntity>> search(String searchTerm);
}

class ContentRepository implements IContentRepository {
  final IContentDataSource dataSource;

  ContentRepository(this.dataSource);

  @override
  Future<List<ContentEntity>> getAll(String sort) => dataSource.getAll(sort);

  @override
  Future<List<ContentEntity>> search(String searchTerm) =>
      dataSource.search(searchTerm);
}
