import 'package:flutter/material.dart';
import 'package:totem_test_app/cube_box.dart';
import 'package:totem_test_app/long_box.dart';
import 'package:totem_test_app/search.dart';

// TODO: get data from elsewhere
const _companies = [
  _DealConfiguration(
    title: "She Native",
    link: "https://www.shenative.com/",
    summary: "Get 5% cash back from any purchase!",
    image: 'assets/images/She_Native.png',
  ),
  _DealConfiguration(
    title: "Target",
    link: "https://www.target.com/",
    summary: "Get 3% cash back from any purchase!",
    image: "assets/images/Target_Logo.png",
  ),
  _DealConfiguration(
    title: "ACONAV",
    link: "https://www.aconav.com/",
    summary: "Get 4% cash back from any purchase!",
    image: "assets/images/ACONAV_Logo.png",
  ),
  _DealConfiguration(
    title: "She Native",
    link: "https://www.shenative.com/",
    summary: "Get 5% cash back from any purchase!",
    image: 'assets/images/She_Native.png',
  ),
  _DealConfiguration(
    title: "Target",
    link: "https://www.target.com/",
    summary: "Get 3% cash back from any purchase!",
    image: "assets/images/Target_Logo.png",
  ),
  _DealConfiguration(
    title: "ACONAV",
    link: "https://www.aconav.com/",
    summary: "Get 4% cash back from any purchase!",
    image: "assets/images/ACONAV_Logo.png",
  ),
  _DealConfiguration(
    title: "She Native",
    link: "https://www.shenative.com/",
    summary: "Get 5% cash back from any purchase!",
    image: 'assets/images/She_Native.png',
  ),
  _DealConfiguration(
    title: "Target",
    link: "https://www.target.com/",
    summary: "Get 3% cash back from any purchase!",
    image: "assets/images/Target_Logo.png",
  ),
  _DealConfiguration(
    title: "ACONAV",
    link: "https://www.aconav.com/",
    summary: "Get 4% cash back from any purchase!",
    image: "assets/images/ACONAV_Logo.png",
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
      const Text(
        "DEALS & OFFERS",
        style: TextStyle(
          color: Color(0xff4f4d4d),
          fontSize: 12,
        ),
      ),
      for (int i = 0; i < _companies.length; i++) ...[
        const SizedBox(height: 32),
        if (i % 3 == 0) _buildCubeBox(i++) else _buildLongBox(i),
      ],
    ];
  }

  Widget _buildCubeBox(int i) {
    if (i < _companies.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CubeBox(
              title: _companies[i].title,
              link: _companies[i].link,
              summary: _companies[i].summary,
              image: _companies[i].image,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: CubeBox(
              title: _companies[i + 1].title,
              link: _companies[i + 1].link,
              summary: _companies[i + 1].summary,
              image: _companies[i + 1].image,
            ),
          ),
        ],
      );
    }
    return LongBox(
      title: _companies[i].title,
      link: _companies[i].link,
      summary: _companies[i].summary,
      image: _companies[i].image,
    );
  }

  Widget _buildLongBox(int i) {
    return LongBox(
      title: _companies[i].title,
      link: _companies[i].link,
      summary: _companies[i].summary,
      image: _companies[i].image,
    );
  }

  List<Widget> _buildSearched() {
    try {
      return [
        for (final item in _companies)
          if (item.title
                  .contains(RegExp(_searchString!, caseSensitive: false)) ||
              item.summary
                  .contains(RegExp(_searchString!, caseSensitive: false))) ...[
            const SizedBox(height: 8),
            LongBox(
              title: item.title,
              link: item.link,
              summary: item.summary,
              image: item.image,
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
    required this.title,
    required this.link,
    required this.summary,
    required this.image,
  });

  final String title;
  final String link;
  final String summary;
  final String image;
}
