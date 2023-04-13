import 'package:flutter/material.dart';
import 'package:totem_test_app/cube_box.dart';
import 'package:totem_test_app/long_box.dart';
import 'package:totem_test_app/search.dart';

// TODO: get data from elsewhere
const _donations = [
  _DonationsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _DonationsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _DonationsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _DonationsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
];

class Donations extends StatefulWidget {
  const Donations({
    super.key,
  });

  @override
  State<Donations> createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
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
      for (int i = 0; i < _donations.length; i++) ...[
        const SizedBox(height: 32),
        if (i % 3 == 0) _buildCubeBox(i++) else _buildLongBox(i),
      ],
    ];
  }

  Widget _buildCubeBox(int i) {
    if (i < _donations.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CubeBox(
              title: _donations[i].title,
              link: _donations[i].link,
              summary: _donations[i].summary,
              image: _donations[i].image,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: CubeBox(
              title: _donations[i + 1].title,
              link: _donations[i + 1].link,
              summary: _donations[i + 1].summary,
              image: _donations[i + 1].image,
            ),
          ),
        ],
      );
    }
    return LongBox(
      title: _donations[i].title,
      link: _donations[i].link,
      summary: _donations[i].summary,
      image: _donations[i].image,
    );
  }

  Widget _buildLongBox(int i) {
    return LongBox(
      title: _donations[i].title,
      link: _donations[i].link,
      summary: _donations[i].summary,
      image: _donations[i].image,
    );
  }

  List<Widget> _buildSearched() {
    try {
      return [
        for (final item in _donations)
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

class _DonationsConfiguration {
  const _DonationsConfiguration({
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
