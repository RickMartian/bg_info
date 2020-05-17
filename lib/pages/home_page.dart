import 'package:bg_info/mobx/pages.dart';
import 'package:bg_info/pages/games_collection_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class PagesNumber {
  static const COLLECTION = 0;
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _selectPage() {
    switch (_selectedIndex) {
      case PagesNumber.COLLECTION:
        return GamesCollectionPage();
      default:
        return Center(
          child: Text("PAGE NUMBER ${_selectedIndex + 1}"),
        );
    }
  }

  bool _pagesToAddActionButton(List<int> pages) {
    bool result = false;
    pages.forEach((singlePage) {
      print('single page -> $singlePage');
      if (singlePage == _selectedIndex) {
        result = true;
      }
    });
    return result;
  }

  void _actionButtonOnPressedByPage(pages) {
    switch (_selectedIndex) {
      case PagesNumber.COLLECTION:
        pages.changeNeedToOpenCollectionPageModal(true);
        break;
      default:
        print("Ainda não há método para a página ${_selectedIndex + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = Provider.of<Pages>(context, listen: false);
    return Scaffold(
      floatingActionButton: _pagesToAddActionButton([PagesNumber.COLLECTION])
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
                selectedIcon:
                    Icon(Icons.favorite, color: Theme.of(context).accentColor),
                label: Text('Amados'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon:
                    Icon(Icons.star, color: Theme.of(context).accentColor),
                label: Text('Favoritos'),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              pages.changeCurrentPage(_selectedIndex);
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: _selectPage(),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
