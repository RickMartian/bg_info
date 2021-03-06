import 'package:bg_info/actions/games_collection_actions.dart';
import 'package:bg_info/components/details_card.dart';
import 'package:bg_info/pages/games_collection_page/games_collection_controller.dart';
import 'package:bg_info/utils/modal.dart';
import 'package:bg_info/utils/debouncer.dart';
import 'package:bg_info/utils/details_card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GamesCollectionPage extends StatelessWidget {
  final Modal modal = Modal();
  final _debouncer = Debouncer(delay: Duration(milliseconds: 1000));
  final _modalDelay = Debouncer(delay: Duration(milliseconds: 250));

  Widget _itemBuilder(BuildContext context, int index, double deviceHeight,
      double deviceWidth, List<Map<String, dynamic>> games) {
    return DetailsCard(
      deviceHeight,
      deviceWidth,
      index,
      games,
      Image.network(
        games[index]["image"],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          renderDetailsText(games[index]["title"], "", TextAlign.center),
          renderDetailsText("Id\n", games[index]["id"], TextAlign.start),
          renderDetailsText("type\n", games[index]["type"], TextAlign.start),
          renderDetailsText(
              "Sleeve\n", games[index]["sleeve"], TextAlign.start),
          renderDetailsText("Posse\n", games[index]["owner"], TextAlign.start),
        ],
      ),
    );
  }

  AlertDialog _renderAlertDialog(
    String title,
    Widget content,
    List<String> options,
    Map<String, dynamic> gameSelected,
    BuildContext context,
  ) {
    final gamesCollectionController =
        Provider.of<GamesCollectionController>(context, listen: false);
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: content,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
      actions: <Widget>[
        FlatButton(
          child: Text(
            options[0],
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            gamesCollectionController
                .changeNeedToOpenCollectionPageModal(false);
            gamesCollectionController.updateGamesCollectionList(gameSelected);
            // Navigator.pop(context);
            Navigator.of(context).popUntil((route) => route.isFirst);
            gamesCollectionController.updateSearchListOfThingsFromBgg([]);
          },
        ),
        FlatButton(
          child: Text(
            options[1],
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _onTapDetailsCardFromSearch(
      Map<String, dynamic> gameSelected, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => _renderAlertDialog(
        "Salvar jogo selecionado",
        Text(
          "Deseja salvar o jogo selecionado?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        ["Sim", "Não"],
        gameSelected,
        context,
      ),
    );
  }

  Widget _searchItemBuilder(
    BuildContext context,
    int index,
    double deviceHeight,
    double deviceWidth,
    List<Map<String, dynamic>> games,
  ) {
    print("GAMES TEST -> $games");
    return (games.length > 0)
        ? InkWell(
            onTap: () => _onTapDetailsCardFromSearch(games[index], context),
            splashColor: Theme.of(context).accentColor,
            child: DetailsCard(
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
                  renderDetailsText(
                      games[index]["title"], "", TextAlign.center),
                  renderDetailsText(
                      "Id\n", games[index]["id"], TextAlign.start),
                  renderDetailsText(
                      "type\n", games[index]["type"], TextAlign.start),
                ],
              ),
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

  void _onChangedSearch(String text, pages, BuildContext context) {
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
    final gamesCollectionController =
        Provider.of<GamesCollectionController>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
            child: TextField(
              onChanged: (value) {
                _onChanged(value, gamesCollectionController);
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
            child: Observer(
              builder: (_) {
                print(
                    'gamesCollectionController state -> $gamesCollectionController');
                return ListView.builder(
                  itemBuilder: (_, int index) => _itemBuilder(
                    context,
                    index,
                    deviceHeight,
                    deviceWidth,
                    gamesCollectionController.gamesCollectionList,
                  ),
                  itemCount:
                      gamesCollectionController.gamesCollectionList.length,
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              if (gamesCollectionController.needToOpenCollectionPageModal) {
                print("ABRIR MODAL!");
                _modalDelay.run(() => modal.mainBottomSheet(
                    context,
                    WillPopScope(
                      onWillPop: () {
                        return _onBackPressedAtModal(gamesCollectionController);
                      },
                      child: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (text) {
                              _onChangedSearch(
                                  text, gamesCollectionController, context);
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
                              print(
                                  "gamesCollectionController STATE -> $gamesCollectionController");
                              if (gamesCollectionController.isLoading) {
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
                                  itemBuilder: (_, int index) =>
                                      _searchItemBuilder(
                                    context,
                                    index,
                                    deviceHeight,
                                    deviceWidth,
                                    gamesCollectionController
                                        .searchThingsFromBgg,
                                  ),
                                  itemCount: gamesCollectionController
                                      .searchThingsFromBgg.length,
                                ),
                              );
                            },
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              gamesCollectionController
                                  .updateSearchListOfThingsFromBgg([]);
                              gamesCollectionController
                                  .changeNeedToOpenCollectionPageModal(false);
                              gamesCollectionController.updateIsLoading(false);
                            },
                            child: Text("Fechar"),
                          ),
                        ],
                      ),
                    ),
                    MediaQuery.of(context).size.height));
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
