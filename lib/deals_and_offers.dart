import 'package:flutter/material.dart';
import 'package:totem_test_app/deals_box1.dart';
import 'package:totem_test_app/deals_box2.dart';
import 'package:totem_test_app/learn_earn.dart';
import 'package:totem_test_app/search.dart';

// TODO: get data from elsewhere
const _companies = [
  _DealConfiguration(
    companyName: "She Native",
    companySite: "https://www.shenative.com/",
    percentBack: 5,
    logo:
        "https://cdn.shopify.com/s/files/1/0420/8613/articles/Untitled_design_1.png?v=1456278404",
  ),
  _DealConfiguration(
    companyName: "Target",
    companySite: "https://www.target.com/",
    percentBack: 3,
    logo:
        "https://corporate.target.com/_media/TargetCorp/Press/B-roll%20and%20Press%20Materials/Logos/Target_Bullseye-Logo_Red.jpg?preset=640w",
  ),
  _DealConfiguration(
    companyName: "ACONAV",
    companySite: "https://www.aconav.com/",
    percentBack: 4,
    logo:
        "https://images.squarespace-cdn.com/content/v1/54b6e17ae4b077c9025f7a14/1480546879783-46XEFRV7UPX4F3WUK3L2/LOGO_ACONAV_BBG.jpg?format=1500w",
  ),
  _DealConfiguration(
    companyName: "She Native",
    companySite: "https://www.shenative.com/",
    percentBack: 5,
    logo:
        "https://cdn.shopify.com/s/files/1/0420/8613/articles/Untitled_design_1.png?v=1456278404",
  ),
  _DealConfiguration(
    companyName: "Target",
    companySite: "https://www.target.com/",
    percentBack: 3,
    logo:
        "https://corporate.target.com/_media/TargetCorp/Press/B-roll%20and%20Press%20Materials/Logos/Target_Bullseye-Logo_Red.jpg?preset=640w",
  ),
  _DealConfiguration(
    companyName: "ACONAV",
    companySite: "https://www.aconav.com/",
    percentBack: 4,
    logo:
        "https://images.squarespace-cdn.com/content/v1/54b6e17ae4b077c9025f7a14/1480546879783-46XEFRV7UPX4F3WUK3L2/LOGO_ACONAV_BBG.jpg?format=1500w",
  ),
  _DealConfiguration(
    companyName: "She Native",
    companySite: "https://www.shenative.com/",
    percentBack: 5,
    logo:
        "https://cdn.shopify.com/s/files/1/0420/8613/articles/Untitled_design_1.png?v=1456278404",
  ),
  _DealConfiguration(
    companyName: "Target",
    companySite: "https://www.target.com/",
    percentBack: 3,
    logo:
        "https://corporate.target.com/_media/TargetCorp/Press/B-roll%20and%20Press%20Materials/Logos/Target_Bullseye-Logo_Red.jpg?preset=640w",
  ),
  _DealConfiguration(
    companyName: "ACONAV",
    companySite: "https://www.aconav.com/",
    percentBack: 4,
    logo:
        "https://images.squarespace-cdn.com/content/v1/54b6e17ae4b077c9025f7a14/1480546879783-46XEFRV7UPX4F3WUK3L2/LOGO_ACONAV_BBG.jpg?format=1500w",
  ),
];

class DealsAndOffers extends StatefulWidget {
  const DealsAndOffers({
    super.key,
  });

  @override
  State<DealsAndOffers> createState() => _DealsAndOffersState();
}

class _DealsAndOffersState extends State<DealsAndOffers> {
  String? _searchString;

  void _changeSearch(String? newSearchString) {
    setState(() {
      _searchString = newSearchString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SearchBox(onSearch: _changeSearch),
        const SizedBox(height: 32),
        if (_searchString != null)
          ..._buildSearched()
        else
          ..._buildUnsearched(),
      ],
    );
  }

  List<Widget> _buildUnsearched() {
    return [
      const LearnEarn(),
      const SizedBox(height: 32),
      const Text(
        "DEALS & OFFERS",
        style: TextStyle(
          color: Color(0xff4f4d4d),
          fontSize: 12,
        ),
      ),
      for (int i = 0; i < _companies.length; i++) ...[
        const SizedBox(height: 32),
        if (i % 3 == 0) _buildBox1(i++) else _buildBox2(i),
      ],
    ];
  }

  Widget _buildBox1(int i) {
    if (i < _companies.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: DealsBox1(
              companyName: _companies[i].companyName,
              companySite: _companies[i].companySite,
              percentBack: _companies[i].percentBack,
              logo: _companies[i].logo,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: DealsBox1(
              companyName: _companies[i + 1].companyName,
              companySite: _companies[i + 1].companySite,
              percentBack: _companies[i + 1].percentBack,
              logo: _companies[i + 1].logo,
            ),
          ),
        ],
      );
    }
    return DealsBox2(
      companyName: _companies[i].companyName,
      companySite: _companies[i].companySite,
      percentBack: _companies[i].percentBack,
      logo: _companies[i].logo,
    );
  }

  Widget _buildBox2(int i) {
    return DealsBox2(
      companyName: _companies[i].companyName,
      companySite: _companies[i].companySite,
      percentBack: _companies[i].percentBack,
      logo: _companies[i].logo,
    );
  }

  List<Widget> _buildSearched() {
    try {
      return [
        for (final item in _companies)
          if (item.companyName
              .contains(RegExp(_searchString!, caseSensitive: false))) ...[
            const SizedBox(height: 8),
            DealsBox2(
              companyName: item.companyName,
              companySite: item.companySite,
              percentBack: item.percentBack,
              logo: item.logo,
            ),
          ]
      ];
    } catch (error) {
      return [
        Text(
          'Invalid search string: "$_searchString"',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ];
    }
  }
}

class _DealConfiguration {
  const _DealConfiguration({
    required this.companyName,
    required this.companySite,
    required this.percentBack,
    required this.logo,
  });

  final String companyName;
  final String companySite;
  final int percentBack;
  final String logo;
}
