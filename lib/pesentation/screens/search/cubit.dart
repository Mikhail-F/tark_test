import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tark_test/core/di/get_it.dart';
import 'package:tark_test/domain/entities/common/result.dart';
import 'package:tark_test/domain/entities/enums/alphabet.dart';
import 'package:tark_test/domain/entities/search/search.dart';
import 'package:tark_test/domain/entities/search/search_item.dart';
import 'package:tark_test/domain/usecases/search/search.dart';
import 'package:tark_test/pesentation/screens/search/state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _feedBackUseCase = getIt();
  SearchCubit() : super(const SearchState());

  Future<void> searchUsers({required String text}) async {
    EasyDebounce.debounce(
      "searchUsers",
      const Duration(milliseconds: 500),
      () async {
        emit(state.copyWith(isLoading: true, isError: false));
        // Проверка на пустое поле ввода
        if (text.trim().isEmpty) {
          return emit(state.copyWith(isLoading: false, users: []));
        }
        final Result<Search> result =
            await _feedBackUseCase.searchUsers(text: text);
        if (result.isSuccess) {
          // Запрос за подписчиками пользователя
          await _getUserFollowers(result.value.items);
          // Запрос за подписками пользователя
          await _getUserFollowing(result.value.items);

          final List<SearchItem> filter_A_H = Alphabet.filterAlphabet(
              items: result.value.items, filterList: Alphabet.list_A_H);
          final List<SearchItem> filter_I_P = Alphabet.filterAlphabet(
              items: result.value.items, filterList: Alphabet.list_I_P);
          final List<SearchItem> filter_Q_Z = Alphabet.filterAlphabet(
              items: result.value.items, filterList: Alphabet.list_Q_Z);

          emit(state.copyWith(
              users: result.value.items,
              filter_A_H: filter_A_H,
              filter_I_P: filter_I_P,
              filter_Q_Z: filter_Q_Z));
        } else {
          emit(state.copyWith(isError: true));
        }
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  Future<void> _getUserFollowers(List<SearchItem> items) async {
    await Future.wait(items.map((el) async {
      final String followersUrl = el.followersUrl.substring(23);
      final Result<int> userFollowers =
          await _feedBackUseCase.getUserFollowers(followersUrl: followersUrl);
      if (userFollowers.isSuccess) el.followersCount = userFollowers.value;
    }).toList());
  }

  Future<void> _getUserFollowing(List<SearchItem> items) async {
    await Future.wait(items.map((el) async {
      final String followingUrl = el.followingUrl.substring(23).replaceAll("{/other_user}", "");
      final Result<int> userFollowing =
          await _feedBackUseCase.getUserFollowing(followingUrl: followingUrl);
      if (userFollowing.isSuccess) el.followingCount = userFollowing.value;
    }).toList());
  }

  @override
  Future<void> close() {
    EasyDebounce.cancel("searchUsers");
    return super.close();
  }
}
