import 'package:dchat/data/models/kontak_model.dart';

abstract class KontakRepository {
  Future<List<KontakModel>> fetch();
}
