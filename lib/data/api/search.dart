import 'package:dio/dio.dart';
import 'package:tark_test/core/di/get_it.dart';
import 'package:tark_test/domain/data/api/search.dart';
import 'package:tark_test/domain/entities/search/search.dart';

class SearchApiImpl implements SearchApi {
  final Dio _client = getIt();

  @override
  Future<Search> searchUsers({required String text}) async {
    final result =
        await _client.get('search/users', queryParameters: {"q": text});
    return Search.fromJson(result.data);
  }

  @override
  Future<int> getUserFollowers({required String followersUrl}) async {
    final result = await _client.get(followersUrl);
    return List.from(result.data).length;
  }

  @override
  Future<int> getUserFollowing({required String followingUrl}) async {
    final result = await _client.get(followingUrl);
    return List.from(result.data).length;
  }
}
