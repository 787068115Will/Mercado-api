import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'pessoa_model.dart';

class PessoaRepository {
  Future<List<PessoaModel>> getPessoasAsync() async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      var response = await dio.get('https://localhost:7290/api/pessoa');

      if (response.statusCode == 200 && response.data != null) {
        return (response.data as List).map((e) {
          return PessoaModel.fromJson(e);
        }).toList();
      }

      return [];
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
