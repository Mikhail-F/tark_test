// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tark_test/domain/entities/search/search_item.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final bool isError;
  final List<SearchItem> users;
  final List<SearchItem> filter_A_H;
  final List<SearchItem> filter_I_P;
  final List<SearchItem> filter_Q_Z;

  const SearchState({
    this.isLoading = false,
    this.isError = false,
    this.users = const [],
    this.filter_A_H = const [],
    this.filter_I_P = const [],
    this.filter_Q_Z = const [],
  });

  @override
  List<Object?> get props => [isLoading, isError, users];

  SearchState copyWith({
    bool? isLoading,
    bool? isError,
    List<SearchItem>? users,
    List<SearchItem>? filter_A_H,
    List<SearchItem>? filter_I_P,
    List<SearchItem>? filter_Q_Z,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      users: users ?? this.users,
      filter_A_H: filter_A_H ?? this.filter_A_H,
      filter_I_P: filter_I_P ?? this.filter_I_P,
      filter_Q_Z: filter_Q_Z ?? this.filter_Q_Z,
    );
  }
}
