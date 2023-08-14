import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/article_list_view_model.dart';
import 'package:newsapp/favorites.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category.dart';
import 'news.dart';

class NewsPage extends StatelessWidget {
  List<Category> categories = [
    Category('business', 'Business'),
    Category('entertainment', 'Entertainment'),
    Category('general', 'General'),
    Category('health', 'Health'),
    Category('science', 'Science'),
    Category('sports', 'Sports'),
    Category('technology', 'Techonology'),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCategoriesTab(vm),
            ),
          ),
          getWidgetByStatus(vm)
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  List<GestureDetector> getCategoriesTab(ArticleListViewModel vm) {
    List<GestureDetector> list = [];
    for (int i = 0; i < categories.length; i++) {
      list.add(
        GestureDetector(
          onTap: () => vm.getNews(categories[i].key),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                categories[i].title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      );
    }

    return list;
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.index) {
      case 2:
        return Expanded(
          child: ListView.builder(
              itemCount: vm.viewModel.articles.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(
                        vm.viewModel.articles[index].urlToImage ??
                            'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                      ),
                      ListTile(
                        title: Text(
                          vm.viewModel.articles[index].title ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            vm.viewModel.articles[index].description ?? ''),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Share.share(
                                  vm.viewModel.articles[index].title ?? '');
                            },
                            icon: Icon(Icons.share_rounded),
                          ),
                          MaterialButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  (vm.viewModel.articles[index].url ?? ''),
                                ),
                              );
                            },
                            child: Text(
                              'Read More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        );

      default:
        return Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}

Widget buildBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: 'Home Page',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: 'Favorites',
      ),
    ],
    onTap: (int index) {
      if (index == 0) {
        // Ana sayfaya yönlendir
        Navigator.popUntil(context, (route) => route.isFirst);
      } else if (index == 1) {
        // Favoriler sayfasına yönlendir
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Favorites()),
        );
      }
    },
  );
}
