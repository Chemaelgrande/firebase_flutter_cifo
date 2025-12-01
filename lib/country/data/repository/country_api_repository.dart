import 'dart:convert';

import 'package:firebase_flutter_cifo/country/data/models/country_dto.dart';
import 'package:firebase_flutter_cifo/country/data/models/my_response_dto.dart';
import 'package:firebase_flutter_cifo/country/data/utils/country_api_urls.dart';
import 'package:http/http.dart' as http;

class CountryApiRepository {
  static Future<MyResponseCountry?> getListCountriesObjetc(
    String nombre,
  ) async {
    String urlString = CountryApiUrls.urlGetCountry(nombre);

    Uri url = Uri.parse(urlString);

    CountryDto? country;
    int? statusCode;

    try {
      await http.get(url).then((http.Response res) {
        final bodyString = res.body;
        statusCode = res.statusCode;
        final body = jsonDecode(bodyString);

        List<dynamic> myResponse = body;
        country = CountryDto.fromJson(myResponse.first);
      });
    } catch (e) {
      print('$e');
      return MyResponseCountry(
        myCountry: null,
        errorMessage: '$e',
        statusCode: statusCode,
      );
    }

    return MyResponseCountry(
      myCountry: country,
      errorMessage: null,
      statusCode: statusCode,
    );
  }
}
