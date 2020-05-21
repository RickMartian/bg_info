import 'package:bg_info/actions/games_collection_actions.dart';
import 'package:bg_info/components/details_card.dart';
import 'package:bg_info/mobx/pages.dart';
import 'package:bg_info/utils/modal.dart';
import 'package:bg_info/utils/debouncer.dart';
import 'package:bg_info/utils/details_card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GamesCollectionPage extends StatefulWidget {
  GamesCollectionPage();

  @override
  _GamesCollectionPageState createState() => _GamesCollectionPageState();
}

class _GamesCollectionPageState extends State<GamesCollectionPage> {
  Modal modal = Modal();
  final _debouncer = Debouncer(delay: Duration(milliseconds: 1000));
  final _modalDelay = Debouncer(delay: Duration(milliseconds: 250));
  final _games = [
    {
      "name": "Unstable Unicorns",
      "sleeve": "Padrão",
      "posse": "Bibi",
      "url":
          "https://cf.geekdo-images.com/original/img/JXjU3CrzgTFZdiY6fP4zO1YPha0=/0x0/pic3912914.jpg"
    },
    {
      "name": "Marrakech",
      "sleeve": "N/A",
      "posse": "N/A",
      "url":
          "https://cf.geekdo-images.com/original/img/JXjU3CrzgTFZdiY6fP4zO1YPha0=/0x0/pic3912914.jpg"
    },
    {
      "name": "Merlin",
      "sleeve": "Padrão euro",
      "posse": "Rick",
      "url":
          "https://cf.geekdo-images.com/original/img/JXjU3CrzgTFZdiY6fP4zO1YPha0=/0x0/pic3912914.jpg"
    },
    {
      "name": "Kitchen Rush",
      "sleeve": "Padrão euro e mini euro",
      "posse": "Rick",
      "url":
          "https://cf.geekdo-images.com/original/img/JXjU3CrzgTFZdiY6fP4zO1YPha0=/0x0/pic3912914.jpg"
    },
    {
      "name": "Covil",
      "sleeve": "Padrão euro e mini euro",
      "posse": "Bibi",
      "url":
          "https://cf.geekdo-images.com/original/img/JXjU3CrzgTFZdiY6fP4zO1YPha0=/0x0/pic3912914.jpg"
    },
  ];

  Widget _itemBuilder(BuildContext context, int index, double deviceHeight,
      double deviceWidth) {
    return DetailsCard(
      deviceHeight,
      deviceWidth,
      index,
      _games,
      Image.network(
        _games[index]["url"],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          renderDetailsText(_games[index]["name"], "", TextAlign.center),
          renderDetailsText(
              "Sleeve\n", _games[index]["sleeve"], TextAlign.start),
          renderDetailsText("Posse\n", _games[index]["posse"], TextAlign.start),
        ],
      ),
    );
  }

  Widget _searchItemBuilder(BuildContext context, int index,
      double deviceHeight, double deviceWidth, games) {
    print("GAMES TEST -> $games");
    return (games.length > 0)
        ? DetailsCard(
            deviceHeight,
            deviceWidth,
            index,
            games,
            Image.network(
              games[index]["image"] != null
                  ? games[index]["image"]
                  : "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                renderDetailsText(games[index]["title"], "", TextAlign.center),
                renderDetailsText("Id\n", games[index]["id"], TextAlign.start),
                renderDetailsText(
                    "type\n", games[index]["type"], TextAlign.start),
              ],
            ),
          )
        : Container(
            child: Text("Nenhum jogo encontrado."),
          );
  }

  void _onChanged(String text, pages) {
    print("text to search -> " + text);
    _debouncer.run(() => print("text to fetch -> " + text));
  }

  void _onChangedSearch(String text, pages) {
    print("VALUE TO SEARCH -> $text");
    _debouncer.run(() => fetchBoardGamesFromBgg(text, context));
  }

  Future<bool> _onBackPressedAtModal(pages) async {
    print("voltou");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    final pages = Provider.of<Pages>(context, listen: false);
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
            child: TextField(
              onChanged: (value) {
                _onChanged(value, pages);
              },
              decoration: InputDecoration(
                labelText: "Pesquisar",
                labelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).accentColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  _itemBuilder(context, index, deviceHeight, deviceWidth),
              itemCount: _games.length,
            ),
          ),
          Observer(builder: (_) {
            if (pages.needToOpenCollectionPageModal) {
              print("ABRIR MODAL!");
              _modalDelay.run(() => modal.mainBottomSheet(
                  context,
                  WillPopScope(
                    onWillPop: () {
                      return _onBackPressedAtModal(pages);
                    },
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (text) {
                            _onChangedSearch(text, pages);
                          },
                          decoration: InputDecoration(
                            labelText: "Pesquisar",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).accentColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) {
                            print("PAGES STATE -> $pages");
                            if (pages.isLoading) {
                              return Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.8),
                                  ),
                                ),
                              );
                            }
                            return Expanded(
                                child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) =>
                                  _searchItemBuilder(
                                context,
                                index,
                                deviceHeight,
                                deviceWidth,
                                pages.searchThingsFromBgg,
                              ),
                              itemCount: pages.searchThingsFromBgg.length,
                            ));
                          },
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            pages.updateSearchListOfThingsFromBgg([]);
                            pages.changeNeedToOpenCollectionPageModal(false);
                            pages.updateIsLoading(false);
                          },
                          child: Text("Fechar"),
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.of(context).size.height));
            }
            return Container();
          })
        ],
      ),
    );
  }
}
