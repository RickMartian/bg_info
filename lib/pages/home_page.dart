import 'package:bg_info/mobx/pages.dart';
import 'package:bg_info/pages/games_collection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PagesNumber {
  static const COLLECTION = 0;
}

class HomePage extends StatelessWidget {
  Widget _selectPage(int index) {
    switch (index) {
      case PagesNumber.COLLECTION:
        return GamesCollectionPage();
      default:
        return Center(
          child: Text("PAGE NUMBER ${index + 1}"),
        );
    }
  }

  bool _pagesToAddActionButton(List<int> pages, int index) {
    bool result = false;
    pages.forEach((singlePage) {
      print('single page -> $singlePage');
      if (singlePage == index) {
        result = true;
      }
    });
    return result;
  }

  void _actionButtonOnPressedByPage(Pages pages) {
    switch (pages.currentPage) {
      case PagesNumber.COLLECTION:
        pages.changeNeedToOpenCollectionPageModal(true);
        break;
      default:
        print("Ainda não há método para a página ${pages.currentPage + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = Provider.of<Pages>(context);
    return Observer(
      builder: (_) {
        return Scaffold(
          key: pages.scaffoldKey,
          floatingActionButton: _pagesToAddActionButton(
                  [PagesNumber.COLLECTION], pages.currentPage)
              ? FloatingActionButton(
                  onPressed: () {
                    _actionButtonOnPressedByPage(pages);
                  },
                  child: Icon(
                    Icons.add,
                  ),
                )
              : Container(),
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: Text("Board Games Info!"),
            elevation: 1.0,
          ),
          body: Row(
            children: <Widget>[
              // Observer(
              // builder: (_) {
              // return
              NavigationRail(
                labelType: NavigationRailLabelType.selected,
                elevation: 1.0,
                selectedLabelTextStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(
                      Icons.book,
                      color: Theme.of(context).accentColor,
                    ),
                    label: Text('Coleção'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite,
                        color: Theme.of(context).accentColor),
                    label: Text('Amados'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon:
                        Icon(Icons.star, color: Theme.of(context).accentColor),
                    label: Text('Favoritos'),
                  ),
                ],
                selectedIndex: pages.currentPage,
                onDestinationSelected: (int index) {
                  pages.changeCurrentPage(index);
                },
                // );
                //  },
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: _selectPage(pages.currentPage),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
