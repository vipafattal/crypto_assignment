import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/ui/currency_details/currency_details_page.dart';
import 'package:crypto_assignment/ui/currency_details/links_page.dart';
import 'package:crypto_assignment/ui/currency_details/tags_page.dart';
import 'package:flutter/material.dart';

class NavigationModel {
  const NavigationModel._();

  static const int NONE = -1;
  static const int HOME_PAGE = 0;
  static const int DETAILS_PAGE = HOME_PAGE + 1;
  static const int CURRENCY_LINKS_PAGE = DETAILS_PAGE + 1;
  static const int CURRENCY_TAGS_PAGE = CURRENCY_LINKS_PAGE + 1;

  static int _currentPage = NONE;

  static int get currentPage => _currentPage;

  static void navigateHome(context) {
    _currentPage = HOME_PAGE;
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  static void opnDetailsPage(context, {required CryptoCurrency currency,required int index}) {
    materialNavPush(
        context, DETAILS_PAGE, CurrencyDetailsPage(currency: currency,index:index));
  }

  static void opnLinksPage(context,
      {required String currencyName,
      required Map<String, List<String>> linksList}) {
    materialNavPush(context, CURRENCY_LINKS_PAGE,
        LinksPage(currencyName: currencyName, linksList: linksList));
  }

  static void opnTagsPage(context,
      {required String currencyName, required List<String> tagsList}) {

    materialNavPush(context, CURRENCY_TAGS_PAGE,
        TagsPage(currencyName: currencyName, tags: tagsList));
  }

  static void materialNavPush(context, int pageID, Widget widget) {
    _currentPage = pageID;

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }
}
