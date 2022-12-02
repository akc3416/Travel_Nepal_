import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/News/news_fetcher_screen.dart';

class NewsScreen extends StatelessWidget {
  final String title;
  const NewsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return NewsFetcherScreen();
  }
}
