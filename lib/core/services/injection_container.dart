import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabra3/features/data/datasources/donor/donor_remote_datasource.dart';
import 'package:tabra3/features/data/datasources/recipient/recipient_remote_datasource.dart';
import 'package:tabra3/features/data/datasources/urgent_case/urgent_case_remote_data_sources.dart';
import 'package:tabra3/features/data/repositories/donor_repository_impl.dart';
import 'package:tabra3/features/data/repositories/recipient_repository_impl.dart';
import 'package:tabra3/features/data/repositories/urgent_case_repository_impl.dart';
import 'package:tabra3/features/domain/repositories/donor_repository.dart';
import 'package:tabra3/features/domain/repositories/recipient_repository.dart';
import 'package:tabra3/features/domain/repositories/urgent_case_repository.dart';
import 'package:tabra3/features/domain/usecases/donor_usecase.dart';
import 'package:tabra3/features/domain/usecases/recipient_usecase.dart';
import 'package:tabra3/features/domain/usecases/urgent_case_usecase.dart';
import 'package:tabra3/features/presentation/view/donors/cubit/donor_cubit.dart';
import 'package:tabra3/features/presentation/view/home/cubit/home_cubit.dart';
import 'package:tabra3/features/presentation/view/login/cubit/login_cubit.dart';
import 'package:tabra3/features/presentation/view/recipient/cubit/recipient_cubit.dart';

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
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl()));
  sl.registerLazySingleton<DonorCubit>(() => DonorCubit(sl()));
  sl.registerLazySingleton<RecipientCubit>(() => RecipientCubit(sl()));

  // Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  sl.registerLazySingleton(
      () => LogInterceptor(requestBody: true, responseBody: true));

  // UseCases
  sl.registerLazySingleton(() => AuthUseCase(sl()));
  sl.registerLazySingleton(() => UrgentCaseUsecase(sl()));
  sl.registerLazySingleton(() => DonorUseCase(sl()));
  sl.registerLazySingleton(() => RecipientUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl()));
  sl.registerLazySingleton<UrgentCaseRepository>(
      () => UrgentCaseRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<DonorRepository>(
      () => DonorRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<RecipientRepository>(
      () => RecipientRepositoryImpl(remoteDataSource: sl()));

  // Data Source
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(preferences: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<UrgentCaseRemoteDataSource>(
      () => UrgentCaseRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<DonorRemoteDataSource>(
      () => DonorRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RecipientRemoteDataSource>(
      () => RecipientRemoteDataSourceImpl(apiConsumer: sl()));

  // External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));
  sl.registerLazySingleton(() => Dio());
}
