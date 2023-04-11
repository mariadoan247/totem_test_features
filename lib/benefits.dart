import 'package:flutter/material.dart';
import 'package:totem_test_app/cube_box.dart';
import 'package:totem_test_app/long_box.dart';
import 'package:totem_test_app/search.dart';

// TODO: get data from elsewhere
const _benefits = [
  _BenefitsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _BenefitsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _BenefitsConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _BenefitsConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
];

class Benefits extends StatefulWidget {
  const Benefits({
    super.key,
  });

  @override
  State<Benefits> createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {
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
      for (int i = 0; i < _benefits.length; i++) ...[
        const SizedBox(height: 32),
        if (i % 3 == 0) _buildCubeBox(i++) else _buildLongBox(i),
      ],
    ];
  }

  Widget _buildCubeBox(int i) {
    if (i < _benefits.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CubeBox(
              title: _benefits[i].title,
              link: _benefits[i].link,
              summary: _benefits[i].summary,
              image: _benefits[i].image,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: CubeBox(
              title: _benefits[i + 1].title,
              link: _benefits[i + 1].link,
              summary: _benefits[i + 1].summary,
              image: _benefits[i + 1].image,
            ),
          ),
        ],
      );
    }
    return LongBox(
      title: _benefits[i].title,
      link: _benefits[i].link,
      summary: _benefits[i].summary,
      image: _benefits[i].image,
    );
  }

  Widget _buildLongBox(int i) {
    return LongBox(
      title: _benefits[i].title,
      link: _benefits[i].link,
      summary: _benefits[i].summary,
      image: _benefits[i].image,
    );
  }

  List<Widget> _buildSearched() {
    try {
      return [
        for (final item in _benefits)
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

class _BenefitsConfiguration {
  const _BenefitsConfiguration({
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
