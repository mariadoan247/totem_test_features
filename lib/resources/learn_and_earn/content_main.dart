import 'package:flutter/material.dart';
import 'package:totem_test_app/resources/learn_and_earn/single_content.dart';

// TODO: Get the data from else where
const _contentList = [
  _ContentConfiguration(
    title: 'Stock 1',
    imageLink:
        'https://ca-times.brightspotcdn.com/dims4/default/b6f626c/2147483647/strip/true/crop/5205x3470+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F85%2F74%2F56a2f96443aea78c00cadbc5c7b9%2Ffinancial-markets-25408.jpg',
    text: 'Text1',
  ),
  _ContentConfiguration(
    title: 'Stock 2',
    imageLink:
        'https://s.marketwatch.com/public/resources/images/MW-DT508_nyse_ZG_20150901145932.jpg',
    text: 'Text1',
  ),
  _ContentConfiguration(
    title: 'Stock 3',
    imageLink:
        'https://www.protocol.com/media-library/robinhood.jpg?id=25549393&width=1245&height=700&quality=85&coordinates=5%2C0%2C5%2C0',
    text: 'Text1',
  ),
];

class ContentMain extends StatefulWidget {
  const ContentMain({super.key});

  @override
  State<ContentMain> createState() => _ContentMainState();
}

class _ContentMainState extends State<ContentMain> {
  int page = 0;

  void _changePage(int value) {
    setState(() {
      if (page + value < 0) {
        print('Already in zero');
        page = 0;
      } else if (page + value > _contentList.length - 1) {
        // route to end of quiz page
      } else {
        page += value;
        print("I was incremented");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleContent(
        title: _contentList[page].title,
        imageLink: _contentList[page].imageLink,
        numPages: _contentList.length,
        currentPage: page,
        onTap: _changePage,
      ),
    );
  }
}

class _ContentConfiguration {
  const _ContentConfiguration({
    required this.title,
    required this.imageLink,
    required this.text,
  });

  final String title;
  final String imageLink;
  final String text;
}
