import 'package:bg_info/config.dart';
import 'package:bg_info/pages/games_collection_page/games_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;

dynamic fetchThingsFromBgg(dynamic id) async {
  final url = "${Config.baseBggUrl}/things?id=$id";
  final response = await http.get(url);
  final myTransformer = Xml2Json();
  if (response.statusCode == 200) {
    myTransformer.parse(response.body);
    final json = myTransformer.toParker();
    Map<String, dynamic> decoded = convert.jsonDecode(json);
    final imageUrl = decoded['items']['item']["image"];
    return imageUrl;
  }
}

dynamic fetchBoardGamesFromBgg(String text, BuildContext context) async {
  print("TEXTO A SER BUSCADO -> $text");
  final gamesCollectionController =
      Provider.of<GamesCollectionController>(context, listen: false);
  gamesCollectionController.updateIsLoading(true);
  final url = "${Config.baseBggUrl}/search?query=$text";
  final response = await http.get(url);
  final myTransformer = Xml2Json();

  if (response.statusCode == 200) {
    List<Map<String, dynamic>> listOfGamesFetched = [];
    myTransformer.parse(response.body);
    final json = myTransformer.toGData();
    try {
      Map<String, dynamic> decoded = convert.jsonDecode(json);
      List<dynamic> array = decoded['items']['item'];
      if (array != null) {
        for (var value in array) {
          final type = value["type"];
          if (type == 'boardgame' || type == 'boardgameexpansion') {
            final id = value["id"];
            final title = value["name"]["value"];
            await fetchThingsFromBgg(id).then((response) {
              final image = response == null
                  ? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
                  : response;
              listOfGamesFetched.add(
                  {"id": id, "title": title, "image": image, "type": type});
            });
          }
        }
      }
      gamesCollectionController
          .updateSearchListOfThingsFromBgg(listOfGamesFetched);
      gamesCollectionController.updateIsLoading(false);
      return listOfGamesFetched;
    } catch (error) {
      print("json parse error -> $error");
      gamesCollectionController.updateIsLoading(false);
      gamesCollectionController.changeNeedToOpenCollectionPageModal(false);
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}
