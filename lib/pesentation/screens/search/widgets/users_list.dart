import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tark_test/pesentation/screens/search/cubit.dart';
import 'package:tark_test/pesentation/screens/search/state.dart';
import 'package:tark_test/pesentation/screens/search/widgets/user_tab_list.dart';
import 'package:tark_test/pesentation/widgets/common/error_loading.dart';
import 'package:tark_test/pesentation/screens/search/widgets/users_not_found.dart';
import 'package:tark_test/pesentation/widgets/custom_app_loader.dart';

class UsersList extends StatelessWidget {
  final TextEditingController controller;
  const UsersList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, state) {
        return Expanded(
          child: Align(
            alignment: Alignment.center,
            child: state.isLoading
                ? const CustomAppLoader()
                : state.isError
                    ? const ErrorLoading()
                    : state.users.isEmpty
                        ? const UsersNotFoundArticle()
                        : DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                const SizedBox(
                                  height: 50,
                                  child: TabBar(
                                    tabs: [
                                      Tab(text: "A-H"),
                                      Tab(text: "I-P"),
                                      Tab(text: "Q-Z"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      UserTabList(list: state.filter_A_H),
                                      UserTabList(list: state.filter_I_P),
                                      UserTabList(list: state.filter_Q_Z),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
          ),
        );
      },
    );
  }
}
