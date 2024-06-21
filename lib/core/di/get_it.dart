import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tark_test/data/api/clients/api_client.dart';
import 'package:tark_test/data/api/search.dart';
import 'package:tark_test/domain/data/api/search.dart';
import 'package:tark_test/domain/usecases/search/search.dart';
import 'package:tark_test/pesentation/screens/search/cubit.dart';

final getIt = GetIt.instance;

Future<void> registerGetIt() async {
  ///Api
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<Dio>(() => getIt<ApiClient>().create());

  getIt.registerLazySingleton<SearchApi>(() => SearchApiImpl());

  ///UseCases
  getIt.registerLazySingleton<SearchUseCase>(() => SearchUseCaseImpl());

  //Cubits
  getIt.registerFactory(() => SearchCubit());
}
