import 'package:flutter/material.dart';
import 'package:tark_test/domain/entities/search/search_item.dart';
import 'package:tark_test/pesentation/screens/search/widgets/user_list_item.dart';
import 'package:tark_test/pesentation/screens/search/widgets/users_not_found.dart';

class UserTabList extends StatelessWidget {
  final List<SearchItem> list;
  const UserTabList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(child: UsersNotFoundArticle())
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final SearchItem user = list[index];
              return UserListItem(user: user);
            },
          );
  }
}
