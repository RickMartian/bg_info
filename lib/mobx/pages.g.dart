// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pages on _Pages, Store {
  final _$currentPageAtom = Atom(name: '_Pages.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$needToOpenCollectionPageModalAtom =
      Atom(name: '_Pages.needToOpenCollectionPageModal');

  @override
  bool get needToOpenCollectionPageModal {
    _$needToOpenCollectionPageModalAtom.reportRead();
    return super.needToOpenCollectionPageModal;
  }

  @override
  set needToOpenCollectionPageModal(bool value) {
    _$needToOpenCollectionPageModalAtom
        .reportWrite(value, super.needToOpenCollectionPageModal, () {
      super.needToOpenCollectionPageModal = value;
    });
  }

  final _$searchThingsFromBggAtom = Atom(name: '_Pages.searchThingsFromBgg');

  @override
  List<Map<String, dynamic>> get searchThingsFromBgg {
    _$searchThingsFromBggAtom.reportRead();
    return super.searchThingsFromBgg;
  }

  @override
  set searchThingsFromBgg(List<Map<String, dynamic>> value) {
    _$searchThingsFromBggAtom.reportWrite(value, super.searchThingsFromBgg, () {
      super.searchThingsFromBgg = value;
    });
  }

  final _$_PagesActionController = ActionController(name: '_Pages');

  @override
  void changeCurrentPage(int newPage) {
    final _$actionInfo =
        _$_PagesActionController.startAction(name: '_Pages.changeCurrentPage');
    try {
      return super.changeCurrentPage(newPage);
    } finally {
      _$_PagesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNeedToOpenCollectionPageModal(bool value) {
    final _$actionInfo = _$_PagesActionController.startAction(
        name: '_Pages.changeNeedToOpenCollectionPageModal');
    try {
      return super.changeNeedToOpenCollectionPageModal(value);
    } finally {
      _$_PagesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchListOfThingsFromBgg(List<Map<String, dynamic>> list) {
    final _$actionInfo = _$_PagesActionController.startAction(
        name: '_Pages.updateSearchListOfThingsFromBgg');
    try {
      return super.updateSearchListOfThingsFromBgg(list);
    } finally {
      _$_PagesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
needToOpenCollectionPageModal: ${needToOpenCollectionPageModal},
searchThingsFromBgg: ${searchThingsFromBgg}
    ''';
  }
}
