import 'package:crypto_assignment/framework/providers/currency_provider.dart';
import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/models/network_process.dart';
import 'package:crypto_assignment/ui/common/resources/strings/strings.dart';
import 'package:crypto_assignment/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ui/common/colours.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final currencyData = CurrencyData();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ));
    return MultiProvider(
      providers: [
        FutureProvider.value(
          value: currencyData.getCurrencies(),
          initialData: NetworkProcess<List<CryptoCurrency>>.processing(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: ThemeData(
          backgroundColor: Colours.colorBackground,
          scaffoldBackgroundColor: Colours.colorBackground,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backwardsCompatibility: true,
            elevation: 8,
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
