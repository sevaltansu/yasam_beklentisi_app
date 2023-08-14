import 'package:flutter/material.dart';
import 'package:newsapp/news_page.dart';
import 'package:provider/provider.dart';

import 'article_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: NewsPage(),
      ),
    );
  }
}
