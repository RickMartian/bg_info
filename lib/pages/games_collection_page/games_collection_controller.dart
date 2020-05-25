import 'package:mobx/mobx.dart';
part 'games_collection_controller.g.dart';

class GamesCollectionController = _GamesCollectionControllerBase
    with _$GamesCollectionController;

abstract class _GamesCollectionControllerBase with Store {
  @observable
  bool needToOpenCollectionPageModal = false;

  @observable
  List<Map<String, dynamic>> searchThingsFromBgg = List<Map<String, dynamic>>();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Map<String, dynamic>> gamesCollectionList =
      List<Map<String, dynamic>>().asObservable();

  @action
  void changeNeedToOpenCollectionPageModal(bool value) {
    needToOpenCollectionPageModal = value;
  }

  @action
  void updateSearchListOfThingsFromBgg(List<Map<String, dynamic>> list) {
    searchThingsFromBgg = list;
  }

  @action
  void updateIsLoading(bool value) {
    isLoading = value;
  }

  @action
  void updateGamesCollectionList(Map<String, dynamic> gameSelected) {
    final gameToSave = {
      "id": gameSelected["id"],
      "title": gameSelected["title"],
      "image": gameSelected["image"],
      "type": gameSelected["type"],
      "sleeve": "N/A",
      "owner": "N/A",
    };
    gamesCollectionList.add(gameToSave);
  }

  @action
  void removeGameFromGamesCollectionList(Map<String, dynamic> gameToRemove) {
    gamesCollectionList
        .removeWhere((element) => element["id"] == gameToRemove["id"]);
  }
}
