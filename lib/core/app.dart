import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tark_test/core/di/get_it.dart';
import 'package:tark_test/pesentation/common/theme/colors.dart';
import 'package:tark_test/pesentation/screens/search/cubit.dart';
import 'package:tark_test/pesentation/screens/search/screen.dart';

class SearchUsersApp extends StatelessWidget {
  const SearchUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(create: (context) => getIt()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          title: 'SearchUsersApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            canvasColor: Colors.grey,
            appBarTheme: const AppBarTheme(centerTitle: true),
            scaffoldBackgroundColor: CustomColors.white,
            primaryColor: Colors.white,
          ),
          home: SearchScreen(),
        ),
      ),
    );
  }
}
