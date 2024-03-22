// ignore_for_file: avoid_print

import 'dart:io';

import 'package:country_task/model/city-resposne-mode.dart';
import 'package:country_task/model/country-response-model.dart';
import 'package:country_task/service/api-service.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  var countryList = <Country>[].obs;
  var cityList = <City>[].obs;
  var isCoutryLoading = false.obs;
  var isCityLoading = false.obs;
  // var isLoading = false.obs;
  var selectedCountry = Country(
          countryId: 0,
          countryName: '',
          flagImage: '',
          countryCode: '',
          status: Status.ACTIVE)
      .obs;

  var selctedCity = City(
          cityId: 0,
          cityName: '',
          status: '',
          counrty: Counrty(
              countryId: 0,
              countryName: "",
              countryCode: "",
              flagImage: "",
              status: ""))
      .obs;

  void getCountries() async {
    isCoutryLoading(true);

    try {
      countryList.value = await APIService.fetchCountries();
      selectedCountry.value = countryList[0];
      print("Successfully Contry Feached");
      isCoutryLoading(false);
    } on SocketException {
      print("No Internet");
    } catch (e) {
      print(e.toString());
    }
  }

  void getCitys() async {
    isCityLoading(true);

    try {
      cityList.value = await APIService.fetchCityByCountry(2);

      if (cityList.isNotEmpty) {
        selctedCity.value = cityList[0];
        print(cityList[0].cityName);
        print("Successfully City Feached");
      }

      isCityLoading(false);
    } on SocketException {
      print("No Internet");
    } catch (e) {
      print(e.toString());
      isCityLoading(false);
    }
  }

  @override
  void onInit() {
    getCountries();
    super.onInit();
  }
}
