import 'package:bg_info/pages/home_page.dart';
import 'package:mobx/mobx.dart';
part 'pages.g.dart';

class Pages = _Pages with _$Pages;

abstract class _Pages with Store {
  @observable
  int currentPage = PagesNumber.COLLECTION;

  @observable
  bool needToOpenCollectionPageModal = false;

  @observable
  List<Map<String, dynamic>> searchThingsFromBgg = List<Map<String, dynamic>>();

  @action
  void changeCurrentPage(int newPage) {
    currentPage = newPage;
  }

  @action
  void changeNeedToOpenCollectionPageModal(bool value) {
    needToOpenCollectionPageModal = value;
  }

  @action
  void updateSearchListOfThingsFromBgg(List<Map<String, dynamic>> list) {
    searchThingsFromBgg = list;
  }
}
