import 'package:dio/dio.dart';
import 'package:dchat/data/models/kontak_model.dart';

abstract class KontakRemoteDataSource {
  Future<List<KontakModel>> fetch();
}

class KontakRemoteDataSourceImpl implements KontakRemoteDataSource {
  KontakRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<KontakModel>> fetch() async {
    try {
      List<KontakModel> listKontak = [];
      final response = await dio.get('http://localhost/dchat/api/kontak/fetch');
      for (var data in response.data['data']) {
        KontakModel kontak = KontakModel.fromJson(data);
        listKontak.add(kontak);
      }
      return listKontak;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
