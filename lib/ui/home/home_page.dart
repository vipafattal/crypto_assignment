import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:crypto_assignment/ui/common/widgets/material_bottom_sheet.dart';
import 'package:crypto_assignment/ui/common/widgets/material_divider.dart';
import 'package:crypto_assignment/ui/common/widgets/material_text_field.dart';
import 'package:crypto_assignment/ui/common/widgets/network_process_widget.dart';
import 'package:crypto_assignment/ui/home/components/home_page_currency_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _searchQuery = '';
  final List<CryptoCurrency> searchedCurrenciesList = [];
  final List<CryptoCurrency> currenciesList = [];
  late TextEditingController searchTextController;

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
    searchTextController.addListener(() {
      _searchQuery = searchTextController.text;
      searchedCurrenciesList.clear();
      final filterData = currenciesList.where(
        (e) =>
            e.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            e.symbol.contains(_searchQuery.toUpperCase()),
      );
      searchedCurrenciesList.addAll(filterData);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Resources.init(context);
    return Scaffold(
      body: NetworkProcessWithProvider<List<CryptoCurrency>>(
        widgetBuilder: (data) {
          if (currenciesList.isEmpty) currenciesList.addAll(data);
          return buildUI(context);
        },
      ),
    );
  }

  Widget buildUI(context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        buildCurrenciesList(context,
            _searchQuery.isNotEmpty ? searchedCurrenciesList : currenciesList),
        buildBottomSearchSheet(),
      ],
    );
  }

  ListView buildCurrenciesList(context, List<CryptoCurrency> currencyList) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      children: [
        SizedBox(height: 12 + MediaQuery.of(context).padding.top),
        Text(
          "Cryptocurrency Explorer",
          style: Resources.textStyles.textHeadings3,
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (_, __) => MaterialDivider(),
          itemCount: currencyList.length,
          itemBuilder: (ctx, index) => HomePageCurrencyItem(
            currency: currencyList[index],
            index: index,
          ),
        ),
        SizedBox(height: 95),
      ],
    );
  }

  Widget buildBottomSearchSheet() {
    final node = FocusScope.of(context);
    return MaterialBottomSheet(
      child: AnimatedSize(
        vsync: this,
        duration: Duration(milliseconds: 300),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Resources.dimensions.horizontalPadding * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom / 5,
                  top: 8,
                ),
                child: MaterialTextField(
                  node: node,
                  inputAction: TextInputAction.search,
                  controller: searchTextController,
                  label: "Search for Currencies",
                  onSubmit: (query) => node.unfocus(),
                  isDense: true,
                  prefixIcon: Icons.search_rounded,
                  onPrefixIconPressed: () => node.unfocus(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }
}
