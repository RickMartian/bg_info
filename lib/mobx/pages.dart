import 'package:bg_info/pages/home_page.dart';
import 'package:mobx/mobx.dart';
part 'pages.g.dart';

class Pages = _Pages with _$Pages;

abstract class _Pages with Store {
  @observable
  int currentPage = PagesNumber.COLLECTION;

  @observable
  bool needToOpenCollectionPageModal = false;

  @action
  changeCurrentPage(int newPage) {
    currentPage = newPage;
  }

  @action
  changeNeedToOpenCollectionPageModal(bool value) {
    needToOpenCollectionPageModal = value;
  }
}
