import 'package:dchat/domain/entity/kontak_entity.dart';

/// Instance of class [kontakEntity] which has the role of fetching and parsing data from/to json.
class KontakModel extends KontakEntity {
  /// Fetch data from json format.
  KontakModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          telepon: json['telepon'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id': id,
          'name': name,
          'telepon': telepon,
        },
      };
}
