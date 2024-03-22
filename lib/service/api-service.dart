import 'dart:convert';

import 'package:country_task/model/city-resposne-mode.dart';
import 'package:country_task/model/country-response-model.dart';
import 'package:country_task/model/registration-request-model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Future<List<Country>> fetchCountries() async {
    final response = await http.get(
        Uri.parse("https://aladin.r-y-x.net/api/v1/settings/country/all-list"));

    if (response.statusCode == 200) {
      CountryResponseModel country =
          CountryResponseModel.fromJson(jsonDecode(response.body));

      return country.data.countries;
    }
    throw Exception('Failed to load countries');
  }

  static Future<List<City>> fetchCityByCountry(int countryId) async {
    final response = await http.get(
      Uri.parse(
        "https://aladin.r-y-x.net/api/v1/settings/city/by-country?countryId=$countryId",
      ),
    );

    if (response.statusCode == 200) {
      CityResponseModel country =
          CityResponseModel.fromJson(jsonDecode(response.body));

      return country.data.cities;
    }
    throw Exception('Failed to load cities');
  }

  static Future<bool> registerUser(RegistrationRequestModel userData) async {
    final response = await http.post(
        Uri.parse(
          "https://aladin.r-y-x.net/api/v1/auth/registration",
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData));

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      return false;
    }
  }
}
