import 'package:bg_info/pages/games_collection_page/games_collection_controller.dart';
import 'package:bg_info/pages/games_collection_page/games_collection_page.dart';
import 'package:bg_info/pages/pages_controller.dart';
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

  void _actionButtonOnPressedByPage(
      GamesCollectionController gamesCollectionController,
      PagesController pagesController) {
    switch (pagesController.currentPage) {
      case PagesNumber.COLLECTION:
        gamesCollectionController.changeNeedToOpenCollectionPageModal(true);
        break;
      default:
        print(
            "Ainda não há método para a página ${pagesController.currentPage + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pagesController = Provider.of<PagesController>(context);
    final gamesCollectionController =
        Provider.of<GamesCollectionController>(context);
    return Observer(
      builder: (_) {
        return Scaffold(
          floatingActionButton: _pagesToAddActionButton(
                  [PagesNumber.COLLECTION], pagesController.currentPage)
              ? FloatingActionButton(
                  onPressed: () {
                    _actionButtonOnPressedByPage(
                        gamesCollectionController, pagesController);
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
                selectedIndex: pagesController.currentPage,
                onDestinationSelected: (int index) {
                  pagesController.changeCurrentPage(index);
                },
                // );
                //  },
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: _selectPage(pagesController.currentPage),
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
