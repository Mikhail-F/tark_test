import 'package:tark_test/domain/entities/search/search_item.dart';

class Alphabet {
  static List<String> get list_A_H => ["a", "b", "c", "d", "e", "f", "g", "h"];
  static List<String> get list_I_P => ["i", "j", "k", "l", "m", "n", "o", "p"];
  static List<String> get list_Q_Z =>
      ["q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

  static List<SearchItem> filterAlphabet({
    required List<SearchItem> items,
    required List<String> filterList,
  }) {
    return items
        .where((el) => filterList.contains(el.login[0].toLowerCase()))
        .toList();
  }
}
