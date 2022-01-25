// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, empty_constructor_bodies, must_be_immutable

import 'package:conversor_moedas/app/components/dropDownTextField.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
/*   HomeView({Key? key, this.fromText, this.toText, this.homeController})
      : super(key: key) {
    
  } */

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController? homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  //const HomeView({Key? key}) : super(key: key){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/logo1.png',
                  ),
                ),
                DropDownTextField(
                  selectedCurrency: homeController!.toCurrency,
                  controller: toText,
                  items: homeController!.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController!.toCurrency = model!;
                    });
                  },
                ),
                DropDownTextField(
                  selectedCurrency: homeController!.fromCurrency,
                  controller: fromText,
                  items: homeController!.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController!.fromCurrency = model!;
                    });
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange)),
                  onPressed: () {
                    homeController!.convert();
                  },
                  child: Text('CONVERTER'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
