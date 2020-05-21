import 'package:bg_info/config.dart';
import 'package:bg_info/mobx/pages.dart';
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
  final url = "${Config.baseBggUrl}/search?query=$text";
  final response = await http.get(url);
  final myTransformer = Xml2Json();
  final pages = Provider.of<Pages>(context, listen: false);

  pages.updateIsLoading(true);

  if (response.statusCode == 200) {
    List<Map<String, dynamic>> listOfGamesFetched = [];
    myTransformer.parse(response.body);
    final json = myTransformer.toGData();
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
            listOfGamesFetched
                .add({"id": id, "title": title, "image": image, "type": type});
          });
        }
      }
    }
    pages.updateSearchListOfThingsFromBgg(listOfGamesFetched);
    pages.updateIsLoading(false);
    return listOfGamesFetched;
  }
}
