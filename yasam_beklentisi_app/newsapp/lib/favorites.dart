import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_page.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Favoriler sayfasının içeriğini düzenleyin
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoriler'),
      ),
      body: Center(
        child: Text('Favoriler sayfası içeriği'),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
