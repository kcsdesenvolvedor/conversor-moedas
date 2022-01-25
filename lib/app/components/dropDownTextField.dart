// ignore_for_file: prefer_const_constructors

import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel? selectedCurrency;
  final TextEditingController? controller;
  void Function(CurrencyModel? model)? onChanged;

  DropDownTextField(
      {Key? key,
      required this.items,
      this.controller,
      required this.onChanged,
      this.selectedCurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropDownValue = 'Real';
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 65,
              child: DropdownButton<CurrencyModel>(
                iconEnabledColor: Colors.deepOrange,
                value: selectedCurrency,
                underline: Container(
                  height: 1,
                  color: Colors.deepOrange,
                ),
                isExpanded: true,
                items: items
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name!),
                        ))
                    .toList(),
                onChanged: onChanged,
              ),
            )),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
        )
      ],
    );
  }
}
