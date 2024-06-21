import 'package:tark_test/domain/entities/search/search_item.dart';

class Search {
  final List<SearchItem> items;

  Search({required this.items});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
        items: List.from(json['items'])
            .map((el) => SearchItem.fromJson(el))
            .toList());
  }
}
