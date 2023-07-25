import 'package:dio/dio.dart';
import 'package:dvh_flutter_application/common/exception.dart';
import 'package:dvh_flutter_application/data/Content.dart';

abstract class IContentDataSource {
  Future<List<ContentEntity>> getAll(int sort);
  Future<List<ContentEntity>> search(String searchTerm);
}

class ContentRemoteDataSource implements IContentDataSource {
  final Dio httpClient;

  ContentRemoteDataSource(this.httpClient);
  @override
  Future<List<ContentEntity>> getAll(int sort) async {
    final response = await httpClient.get('product/list?sort=$sort');
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

  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}
