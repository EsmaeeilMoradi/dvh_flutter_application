import 'package:dio/dio.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/common/http_response_validator.dart';

abstract class IContentDataSource {
  Future<List<ContentEntity>> getAll(String sort);
  Future<List<ContentEntity>> search(String searchTerm);
}

class ContentRemoteDataSource
    with HttpResponseValidator
    implements IContentDataSource {
  final Dio httpClient;

  ContentRemoteDataSource(this.httpClient);
  @override
  Future<List<ContentEntity>> getAll(String sort) async {
    final response = await httpClient.get('products?sort=$sort');
    validateResponse(response);
    final products = <ContentEntity>[];
    (response.data as List).forEach((element) {
      products.add(ContentEntity.fromJson(element));
    });
    return products;
  }

  @override
  Future<List<ContentEntity>> search(String searchTerm) async {
    final response = await httpClient.get('product/search?q=$searchTerm');
    validateResponse(response);
    final products = <ContentEntity>[];
    (response.data as List).forEach((element) {
      products.add(ContentEntity.fromJson(element));
    });
    return products;
  }
}
