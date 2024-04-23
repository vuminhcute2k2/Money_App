import 'package:get/get.dart';

class CurrencyController extends GetxController {
  var selectedCurrency = 'VND'.obs; // Mặc định là VND

  final List<CurrencyItem> availableCurrencies = [
    CurrencyItem('VN', 'Vietnam Dong', '₫'),
    CurrencyItem('US', 'US Dollar', '\$'),
    CurrencyItem('KR', 'South Korean Won', '₩'),
    CurrencyItem('JP', 'Japanese Yen', '¥'),
    // Thêm các đơn vị tiền tệ khác ở đây
  ];

  void selectCurrency(CurrencyItem currency) {
    selectedCurrency.value = currency.countryCode;
  }
}

class CurrencyItem {
  final String countryCode; // Mã quốc gia
  final String name;
  final String symbol;

  CurrencyItem(this.countryCode, this.name, this.symbol);
}