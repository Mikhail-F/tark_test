import 'package:flutter/material.dart';
import 'package:tark_test/domain/entities/search/search_item.dart';
import 'package:tark_test/pesentation/common/custom_styles/custom_styles.dart';
import 'package:tark_test/pesentation/common/theme/colors.dart';

class UserListItem extends StatelessWidget {
  final SearchItem user;
  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
          color: CustomColors.white),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 60,
              height: 60,
              child: user.imageUrl != null
                  ? Image.network(user.imageUrl!)
                  : const SizedBox.shrink(),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.login,
                style: CustomStyles.normalRegular(),
              ),
              const SizedBox(height: 5),
              Text(
                  "Подписок: ${user.followingCount != null ? user.followingCount.toString() : "-"}"),
              const SizedBox(height: 5),
              Text(
                  "Подписчиков: ${user.followersCount != null ? user.followersCount.toString() : "-"}"),
            ],
          )
        ],
      ),
    );
  }
}
