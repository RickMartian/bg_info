import 'package:bg_info/pages/games_collection_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Pages {
  static const COLLECTION = 0;
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _selectPage() {
    switch (_selectedIndex) {
      case Pages.COLLECTION:
        return GamesCollectionPage();
      default:
        return Center(
          child: Text("PAGE NUMBER ${_selectedIndex + 1}"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.purpleAccent[100],
            ),
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(
                  Icons.book,
                  color: Colors.purpleAccent[100],
                ),
                label: Text('Coleção'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon:
                    Icon(Icons.favorite, color: Colors.purpleAccent[100]),
                label: Text('Amados'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star, color: Colors.purpleAccent[100]),
                label: Text('Favoritos'),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
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
                color: Colors.purpleAccent[100],
              ),
            ),
          )
        ],
      ),
    );
  }
}
