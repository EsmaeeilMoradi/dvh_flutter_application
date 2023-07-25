
import 'package:dio/dio.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/source/content_data_source.dart';

final httpClient =
    Dio(BaseOptions(baseUrl: 'http://DVHURL.com/api/v?/'));

final productRepository =
    ProductRepository(ContentRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<ContentEntity>> getAll(int sort);
  Future<List<ContentEntity>> search(String searchTerm);
}

class ProductRepository implements IProductRepository {
  final IContentDataSource dataSource;

  ProductRepository(this.dataSource);
  
  @override
  Future<List<ContentEntity>> getAll(int sort) => dataSource.getAll(sort);

  @override
  Future<List<ContentEntity>> search(String searchTerm) =>
      dataSource.search(searchTerm);
}