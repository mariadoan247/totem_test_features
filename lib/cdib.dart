import 'package:flutter/material.dart';
import 'package:totem_test_app/cube_box.dart';
import 'package:totem_test_app/long_box.dart';
import 'package:totem_test_app/search.dart';

// TODO: get data from elsewhere
const _cdib = [
  _CDIBConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _CDIBConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _CDIBConfiguration(
    title: "Choctaw Benefit",
    link: "https://www.choctawnation.com/services/supportive-elder-housing/",
    summary: "202 Supportive Elder Housing",
    image: "assets/images/Choctaw_seal.png",
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
  _CDIBConfiguration(
    title: "Chickasaw Benefit",
    link:
        "https://www.chickasaw.net/Services/Culture/Chickasaw-Language-Revitalization-Program.aspx",
    summary: "Chickasaw Language Revitalization Program",
    image: 'assets/images/Chickasaw_Seal.png',
  ),
];

class CDIB extends StatefulWidget {
  const CDIB({
    super.key,
  });

  @override
  State<CDIB> createState() => _CDIBState();
}

class _CDIBState extends State<CDIB> {
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
        "CDIB",
        style: TextStyle(
          color: Color(0xff4f4d4d),
          fontSize: 12,
        ),
      ),
      for (int i = 0; i < _cdib.length; i++) ...[
        const SizedBox(height: 32),
        if (i % 3 == 0) _buildCubeBox(i++) else _buildLongBox(i),
      ],
    ];
  }

  Widget _buildCubeBox(int i) {
    if (i < _cdib.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CubeBox(
              title: _cdib[i].title,
              link: _cdib[i].link,
              summary: _cdib[i].summary,
              image: _cdib[i].image,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: CubeBox(
              title: _cdib[i + 1].title,
              link: _cdib[i + 1].link,
              summary: _cdib[i + 1].summary,
              image: _cdib[i + 1].image,
            ),
          ),
        ],
      );
    }
    return LongBox(
      title: _cdib[i].title,
      link: _cdib[i].link,
      summary: _cdib[i].summary,
      image: _cdib[i].image,
    );
  }

  Widget _buildLongBox(int i) {
    return LongBox(
      title: _cdib[i].title,
      link: _cdib[i].link,
      summary: _cdib[i].summary,
      image: _cdib[i].image,
    );
  }

  List<Widget> _buildSearched() {
    try {
      return [
        for (final item in _cdib)
          if (item.title
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

class _CDIBConfiguration {
  const _CDIBConfiguration({
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
