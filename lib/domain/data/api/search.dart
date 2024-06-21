import 'package:tark_test/domain/entities/search/search.dart';

abstract class SearchApi {
  Future<Search> searchUsers({required String text});

  Future<int> getUserFollowers({required String followersUrl});

  Future<int> getUserFollowing({required String followingUrl});
}
