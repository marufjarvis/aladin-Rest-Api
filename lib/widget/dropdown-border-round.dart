import 'package:country_task/model/country-response-model.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<dynamic> items;
  final dynamic value;
  final ValueChanged onChanged;
  final String keyName;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.keyName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<dynamic>(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        value: value,
        iconSize: 50,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<dynamic>>((value) {
          if (keyName == "countryName") {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.countryName),
            );
          } else {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.cityName),
            );
          }
        }).toList(),
      ),
    );
  }
}
