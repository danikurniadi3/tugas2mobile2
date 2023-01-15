import 'package:dchat/data/models/kontak_model.dart';
import 'package:dchat/domain/repositories/kontak_repository.dart';

class FetchKontakUseCase {
  FetchKontakUseCase({required this.kontakRepository});

  final KontakRepository kontakRepository;

  Future<List<KontakModel>> call() async {
    return await kontakRepository.fetch();
  }
}
