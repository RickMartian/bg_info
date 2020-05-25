import 'package:mobx/mobx.dart';
import 'home_page/home_page.dart';
part 'pages_controller.g.dart';

class PagesController = _PagesController with _$PagesController;

abstract class _PagesController with Store {
  @observable
  int currentPage = PagesNumber.COLLECTION;

  @action
  void changeCurrentPage(int newPage) {
    currentPage = newPage;
  }
}
