import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  static const _borderColor = Color(0xff3c3c3c);
  static const _iconColor = Colors.grey;
  static const _iconSize = 20.0;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _borderColor,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
                      hintText: 'Search for deals',
                      hintStyle: TextStyle(color: _borderColor),
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      setState(() {
                        _focusNode.requestFocus();
                      });
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '|',
                        style: TextStyle(fontSize: 24, color: _borderColor),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.search,
                        size: _iconSize,
                        color: _borderColor,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Search',
                        style: TextStyle(fontSize: 16, color: _borderColor),
                      ),
                      SizedBox(width: 12.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
