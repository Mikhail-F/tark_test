import 'package:tark_test/core/di/get_it.dart';
import 'package:tark_test/domain/data/api/search.dart';
import 'package:tark_test/domain/entities/common/result.dart';
import 'package:tark_test/domain/entities/search/search.dart';

abstract class SearchUseCase {
  Future<Result<Search>> searchUsers({required String text});

  Future<Result<int>> getUserFollowers({required String followersUrl});

  Future<Result<int>> getUserFollowing({required String followingUrl});
}

class SearchUseCaseImpl implements SearchUseCase {
  final SearchApi _searchApi = getIt();

  @override
  Future<Result<Search>> searchUsers({required String text}) async {
    try {
      final Search result = await _searchApi.searchUsers(text: text);
      return Result.success(result);
    } catch (e) {
      return Result.failure("Не удалось найти пользователей.");
    }
  }

  @override
  Future<Result<int>> getUserFollowers({required String followersUrl}) async {
    try {
      final int result =
          await _searchApi.getUserFollowers(followersUrl: followersUrl);
      return Result.success(result);
    } catch (e) {
      return Result.failure("Не удалось загрузить подписчиков пользователя.");
    }
  }

  @override
  Future<Result<int>> getUserFollowing({required String followingUrl}) async {
    try {
      final int result =
          await _searchApi.getUserFollowing(followingUrl: followingUrl);
      return Result.success(result);
    } catch (e) {
      return Result.failure("Не удалось загрузить подписок пользователя.");
    }
  }
}
