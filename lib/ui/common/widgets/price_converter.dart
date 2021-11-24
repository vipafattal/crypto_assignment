import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:crypto_assignment/ui/common/widgets/material_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colours.dart';
import 'logo_image.dart';

class CurrencyConverter extends StatefulWidget {
  final CryptoCurrency currency;

  const CurrencyConverter({Key? key, required this.currency}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {

  late _Converter converter;
  late TextEditingController cryptoController;
  late TextEditingController moneyController;

  final moneyFormatter =   NumberFormat.simpleCurrency(name: '', decimalDigits: 2);
  final cryptoFormatter =   NumberFormat.simpleCurrency(name: '', decimalDigits: 9);

  @override
  void initState() {
    super.initState();
    converter =
        _Converter(singleCryptoInMoney: widget.currency.quoteInUSD.price);

    moneyController = TextEditingController();
    cryptoController = TextEditingController();

    moneyController.addListener(() {
      final money = double.parse(moneyController.text);
      if (money != converter.currentMoney) {
        converter.setMoneyAmount = money;
        cryptoController.text = cryptoFormatter.format(converter.currentCrypto);
      }
    });
    cryptoController.addListener(() {
      final cryptos = double.parse(cryptoController.text);
      if (cryptos != converter.currentCrypto) {
        converter.setCryptoAmount = cryptos;
        moneyController.text = moneyFormatter.format(converter.currentMoney);
      }
    });
    cryptoController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  ${widget.currency.symbol} to USD Converter',
          style: Resources.textStyles.textBody1,
        ),
        SizedBox(height: 8),
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(width: 3, color: Colours.colorItemSecondary)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildMoney(
                backgroundColor: Colors.transparent,
                controller: cryptoController,
                logo: LogoImage(
                  url: widget.currency.largeImageUrl,
                  size: 32,
                ),
                symbol: widget.currency.symbol,
                name: widget.currency.name,
              ),
              buildMoney(
                backgroundColor: Colors.grey.withOpacity(0.1),
                controller: moneyController,
                logo: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 32,
                    height: 32,
                    color: Colors.green,
                    child: Text(
                      "\$",
                      style: Resources.textStyles.textBody5
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                symbol: "USD",
                name: "US Dollar",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildMoney({
    required Widget logo,
    required Color backgroundColor,
    required TextEditingController controller,
    required String name,
    required String symbol,
  }) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(left: 18,right: 8),
      color: backgroundColor,
      child: Row(
        children: [
          logo,
          SizedBox(width: 12.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symbol,
                style: Resources.textStyles.textSecondary2,
              ),
              Text(name, style: Resources.textStyles.textBody7),
            ],
          ),
          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 170),
            child: SizedBox(
                height: 100,
                child: MaterialTextField(
                  controller: controller,
                  borderlessStyle: true,
                  fieldType: TextInputType.number,
                )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    cryptoController.dispose();
    moneyController.dispose();
    super.dispose();
  }
}

class _Converter {
  final double singleCryptoInMoney;

  double currentCrypto = 0;
  double currentMoney = 0;

  _Converter({required this.singleCryptoInMoney});

  set setCryptoAmount(double cryptos) {
    currentCrypto = cryptos;
    currentMoney = singleCryptoInMoney * currentCrypto;
  }

  set setMoneyAmount(double money) {
    currentMoney = money;
    currentCrypto = money / singleCryptoInMoney;
  }
}
