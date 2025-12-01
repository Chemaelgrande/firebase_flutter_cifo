import 'package:firebase_flutter_cifo/country/data/models/country_dto.dart';

class MyResponseCountry {
  final CountryDto? myCountry;
  final String? errorMessage;
  final String? firebaseErrorMessage;
  final int? statusCode;

  MyResponseCountry({
    this.myCountry,
    this.errorMessage,
    this.firebaseErrorMessage,
    this.statusCode,
  });
}
