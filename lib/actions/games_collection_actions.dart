import 'package:bg_info/config.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;

void fetchThingsFromBgg(dynamic id) async {
  final url = "${Config.baseBggUrl}/things?id=$id";
  final response = await http.get(url);
  final myTransformer = Xml2Json();
  if (response.statusCode == 200) {
    myTransformer.parse(response.body);
    final json = myTransformer.toGData();
    Map<String, dynamic> decoded = convert.jsonDecode(json);
    final imageUrl = decoded['items']['item']["image"]["\$t"];
    print("IMAGE -> $imageUrl");
    // TODO: implementar para enviar a imagem e o nome a Store e criar variavel para armazenar a busca formatada e retornar na lista aberta!
  }
}

void fetchFromBgg(String text) async {
  print("TEXTO A SER BUSCADO -> $text");
  final url = "${Config.baseBggUrl}/search?query=$text";
  final response = await http.get(url);
  final myTransformer = Xml2Json();

  if (response.statusCode == 200) {
    print("respXml -> ${response.body}");
    myTransformer.parse(response.body);
    final json = myTransformer.toGData();
    Map<String, dynamic> decoded = convert.jsonDecode(json);
    List<dynamic> array = decoded['items']['item'];
    array?.forEach((dynamic value) {
      print("ITEM -> $value");
      final id = value["id"];
      fetchThingsFromBgg(id);
    });
  }
}
