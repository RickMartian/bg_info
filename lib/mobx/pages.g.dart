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

  final _$isLoadingAtom = Atom(name: '_Pages.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$gamesCollectionListAtom = Atom(name: '_Pages.gamesCollectionList');

  @override
  List<Map<String, dynamic>> get gamesCollectionList {
    _$gamesCollectionListAtom.reportRead();
    return super.gamesCollectionList;
  }

  @override
  set gamesCollectionList(List<Map<String, dynamic>> value) {
    _$gamesCollectionListAtom.reportWrite(value, super.gamesCollectionList, () {
      super.gamesCollectionList = value;
    });
  }

  final _$scaffoldKeyAtom = Atom(name: '_Pages.scaffoldKey');

  @override
  GlobalKey<ScaffoldState> get scaffoldKey {
    _$scaffoldKeyAtom.reportRead();
    return super.scaffoldKey;
  }

  @override
  set scaffoldKey(GlobalKey<ScaffoldState> value) {
    _$scaffoldKeyAtom.reportWrite(value, super.scaffoldKey, () {
      super.scaffoldKey = value;
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
  void updateIsLoading(bool value) {
    final _$actionInfo =
        _$_PagesActionController.startAction(name: '_Pages.updateIsLoading');
    try {
      return super.updateIsLoading(value);
    } finally {
      _$_PagesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateGamesCollectionList(Map<String, dynamic> gameToSave) {
    final _$actionInfo = _$_PagesActionController.startAction(
        name: '_Pages.updateGamesCollectionList');
    try {
      return super.updateGamesCollectionList(gameToSave);
    } finally {
      _$_PagesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
needToOpenCollectionPageModal: ${needToOpenCollectionPageModal},
searchThingsFromBgg: ${searchThingsFromBgg},
isLoading: ${isLoading},
gamesCollectionList: ${gamesCollectionList},
scaffoldKey: ${scaffoldKey}
    ''';
  }
}
