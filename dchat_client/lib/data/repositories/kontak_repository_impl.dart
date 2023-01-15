import 'package:dchat/data/data_sources/remote/kontak_remote_data_source.dart';
import 'package:dchat/data/models/kontak_model.dart';
import 'package:dchat/domain/repositories/kontak_repository.dart';

class KontakRepositoryImpl implements KontakRepository {
  KontakRepositoryImpl({required this.kontakRemoteDataSource});

  final KontakRemoteDataSource kontakRemoteDataSource;

  @override
  Future<List<KontakModel>> fetch() async {
    return await kontakRemoteDataSource.fetch();
  }
}
