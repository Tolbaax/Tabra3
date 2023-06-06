import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/datasources/auth/auth_local_datasources.dart';
import '../../features/data/datasources/auth/auth_remote_datasources.dart';
import '../../features/data/repositories/auth_repository_impl.dart';
import '../../features/domain/repositories/auth_repository.dart';
import '../../features/domain/usecases/auth_usecase.dart';
import '../../features/presentation/view/register/cubit/signup_cubit.dart';
import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../network/local/cache_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerLazySingleton<SignUpCubit>(() => SignUpCubit(sl()));

  // Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  sl.registerLazySingleton(
      () => LogInterceptor(requestBody: true, responseBody: true));

  // UseCases
  sl.registerLazySingleton(() => AuthUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl()));

  // Data Source
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(preferences: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));

  // External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));
  sl.registerLazySingleton(() => Dio());
}
