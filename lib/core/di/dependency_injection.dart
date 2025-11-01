import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/movie_local_data_source.dart';
import '../../features/home/data/datasources/movie_remote_data_source.dart';
import '../../features/home/data/repositories/movie_repository_impl.dart';
import '../../features/home/domain/repositories/movie_repository.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/movie_details/data/datasources/details_remote_data_source.dart';
import '../../features/movie_details/data/repositories/movie_details_repository_impl.dart';
import '../../features/movie_details/domain/repositories/movie_details_repository.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../database/app_database.dart';
import '../network/connectivity_service.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../theme/theme_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Services
  getIt.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService(Connectivity()),
  );

  // Data Sources
  getIt.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSource(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSource(
      getIt<ApiService>(),
      getIt<MovieLocalDataSource>(),
      getIt<ConnectivityService>(),
    ),
  );
  getIt.registerLazySingleton<DetailsRemoteDataSource>(
    () => DetailsRemoteDataSource(getIt<ApiService>()),
  );

  // Repository
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getIt<MovieRemoteDataSource>(),
      getIt<MovieLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton<MovieDetailsRepository>(
    () => MovieDetailsRepositoryImpl(getIt<DetailsRemoteDataSource>()),
  );

  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<MovieRepository>()));
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(getIt<MovieDetailsRepository>()),
  );
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
