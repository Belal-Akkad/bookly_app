import 'package:bookly_app/core/utilities/api_service.dart';
import 'package:bookly_app/features/details/data/data_source/details_remote_data_source.dart';
import 'package:bookly_app/features/details/data/data_source/details_remote_data_source_impl.dart';
import 'package:bookly_app/features/details/data/repo_impl/details_repo_impl.dart';
import 'package:bookly_app/features/details/domain/repo/details_repo.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source_impl.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookly_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:bookly_app/features/search/data/repo_impl/search_repo_impl.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupServerLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImpl(),
  );

  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRemoteDataSource>(
      SearchRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<DetailsRemoteDataSource>(
      DetailsRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>(),
    ),
  );

  getIt.registerSingleton<DetailsRepo>(DetailsRepoImpl(
      detailsBooksRemoteDataSource: getIt.get<DetailsRemoteDataSource>()));

  getIt.registerSingleton<SearchRepo>(SearchRepoImpl(
      searchRemoteDataSource: getIt.get<SearchRemoteDataSource>()));
}
