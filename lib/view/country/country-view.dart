import 'package:country_task/controller/country-controller.dart';
import 'package:country_task/model/country-response-model.dart';
import 'package:country_task/model/registration-request-model.dart';
import 'package:country_task/service/api-service.dart';
import 'package:country_task/widget/dropdown-border-round.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryView extends StatelessWidget {
  const CountryView({super.key});

  @override
  Widget build(BuildContext context) {
    final CountryController controller = Get.put(CountryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Country"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Obx(() {
            return controller.isCoutryLoading.isFalse
                ? CustomDropdown(
                    items: controller.countryList,
                    value: controller.selectedCountry.value,
                    onChanged: (value) {
                      controller.selectedCountry.value = value;
                      controller.getCitys();
                    },
                    keyName: 'countryName',
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
          Obx(() {
            return controller.cityList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text("Choose Contry Name"),
                    ),
                  )
                : controller.isCityLoading.isFalse
                    ? CustomDropdown(
                        items: controller.cityList,
                        value: controller.selctedCity.value,
                        keyName: "cityName",
                        onChanged: (value) {
                          controller.selctedCity.value = value;
                        })
                    : const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
          }),
          ElevatedButton(
              onPressed: () {
                APIService.registerUser(RegistrationRequestModel(
                    fullName: 'Utsa',
                    gender: "Male",
                    email: "utsa@gmai.com",
                    phoneNumber: "01866478941",
                    password: "password",
                    confirmPassword: "password",
                    deviceId: "12121",
                    firebaseToken: "sdfsdfsdsf",
                    countryId: 2,
                    cityId: 29,
                    postCode: "1630",
                    streetAddressOne: "sdfas",
                    streetAddressTwo: "strisdfsdfng",
                    invitationCode: "sdfsd",
                    image: "dsfsd.com"));
              },
              child: const Text("Register Now"))
        ],
      ),
    );
  }
}
