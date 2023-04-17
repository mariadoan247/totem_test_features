import 'package:flutter/material.dart';
import 'package:totem_test_app/learn_and_earn/single_content.dart';

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
        'https://ca-times.brightspotcdn.com/dims4/default/b6f626c/2147483647/strip/true/crop/5205x3470+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F85%2F74%2F56a2f96443aea78c00cadbc5c7b9%2Ffinancial-markets-25408.jpg',
    text: 'Text1',
  ),
  _ContentConfiguration(
    title: 'Stock 3',
    imageLink:
        'https://ca-times.brightspotcdn.com/dims4/default/b6f626c/2147483647/strip/true/crop/5205x3470+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F85%2F74%2F56a2f96443aea78c00cadbc5c7b9%2Ffinancial-markets-25408.jpg',
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleContent(),
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
