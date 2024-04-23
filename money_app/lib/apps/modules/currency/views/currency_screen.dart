import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_flags/country_flags.dart';
import 'package:money_app/apps/modules/currency/controllers/currency_controller.dart';
import 'package:money_app/apps/routers/app_routers.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final CurrencyController currencyController = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Thiết lập tiền tệ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(221, 56, 185, 241),
      ),
      body: ListView.builder(
        itemCount: currencyController.availableCurrencies.length,
        itemBuilder: (context, index) {
          final currency = currencyController.availableCurrencies[index];
          return ListTile(
            leading: CountryFlag.fromCountryCode(
              currency.countryCode,
              width: 40,
              height: 40,
            ),
            title: Text(currency.name),
            trailing: Text(currency.symbol),
            onTap: () {
              currencyController.selectCurrency(currency);
              Navigator.pushNamed(context, AppRouterName.Login);
            },
          );
        },
      ),
    );
  }
}
