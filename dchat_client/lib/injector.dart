import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:dchat/data/data_sources/remote/kontak_remote_data_source.dart';
import 'package:dchat/data/repositories/kontak_repository_impl.dart';
import 'package:dchat/domain/repositories/kontak_repository.dart';
import 'package:dchat/domain/use_cases/fetch_kontak_use_case.dart';
import 'package:dchat/presentation/blocs/bloc/kontak_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [KontakBloc].
  sl.registerFactory(() => KontakBloc(fetchKontakUseCase: sl()));

  // usecases
  // registering service locator for [FetchKontakUseCase].
  sl.registerLazySingleton(() => FetchKontakUseCase(kontakRepository: sl()));

  // repositories
  // registering service locator for [KontakRepository].
  sl.registerLazySingleton<KontakRepository>(
      () => KontakRepositoryImpl(kontakRemoteDataSource: sl()));

  // datasources
  // registering service locator for [KontakRemoteDataSource].
  sl.registerLazySingleton<KontakRemoteDataSource>(
      () => KontakRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
