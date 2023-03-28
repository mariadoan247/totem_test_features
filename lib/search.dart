import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
    this.onSearch,
  });

  final void Function(String?)? onSearch;

  @override
  // ignore: library_private_types_in_public_api
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  static const _borderColor = Color(0xff3c3c3c);
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
      height: 56,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
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
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    fontSize: 24,
                    color: _borderColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.onSearch?.call(_searchController.text.trim().isEmpty
                        ? null
                        : _searchController.text.trim());
                  },
                  hoverColor: const Color(0x991e1e1e),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(width: 8.0),
                        Icon(
                          Icons.search,
                          size: _iconSize,
                          color: _borderColor,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16,
                            color: _borderColor,
                          ),
                        ),
                        SizedBox(width: 12.0),
                      ],
                    ),
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
