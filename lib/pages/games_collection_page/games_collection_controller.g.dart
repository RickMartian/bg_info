// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_collection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GamesCollectionController on _GamesCollectionControllerBase, Store {
  final _$needToOpenCollectionPageModalAtom = Atom(
      name: '_GamesCollectionControllerBase.needToOpenCollectionPageModal');

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

  final _$searchThingsFromBggAtom =
      Atom(name: '_GamesCollectionControllerBase.searchThingsFromBgg');

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

  final _$isLoadingAtom =
      Atom(name: '_GamesCollectionControllerBase.isLoading');

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

  final _$gamesCollectionListAtom =
      Atom(name: '_GamesCollectionControllerBase.gamesCollectionList');

  @override
  ObservableList<Map<String, dynamic>> get gamesCollectionList {
    _$gamesCollectionListAtom.reportRead();
    return super.gamesCollectionList;
  }

  @override
  set gamesCollectionList(ObservableList<Map<String, dynamic>> value) {
    _$gamesCollectionListAtom.reportWrite(value, super.gamesCollectionList, () {
      super.gamesCollectionList = value;
    });
  }

  final _$_GamesCollectionControllerBaseActionController =
      ActionController(name: '_GamesCollectionControllerBase');

  @override
  void changeNeedToOpenCollectionPageModal(bool value) {
    final _$actionInfo =
        _$_GamesCollectionControllerBaseActionController.startAction(
            name:
                '_GamesCollectionControllerBase.changeNeedToOpenCollectionPageModal');
    try {
      return super.changeNeedToOpenCollectionPageModal(value);
    } finally {
      _$_GamesCollectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchListOfThingsFromBgg(List<Map<String, dynamic>> list) {
    final _$actionInfo =
        _$_GamesCollectionControllerBaseActionController.startAction(
            name:
                '_GamesCollectionControllerBase.updateSearchListOfThingsFromBgg');
    try {
      return super.updateSearchListOfThingsFromBgg(list);
    } finally {
      _$_GamesCollectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateIsLoading(bool value) {
    final _$actionInfo = _$_GamesCollectionControllerBaseActionController
        .startAction(name: '_GamesCollectionControllerBase.updateIsLoading');
    try {
      return super.updateIsLoading(value);
    } finally {
      _$_GamesCollectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateGamesCollectionList(Map<String, dynamic> gameSelected) {
    final _$actionInfo =
        _$_GamesCollectionControllerBaseActionController.startAction(
            name: '_GamesCollectionControllerBase.updateGamesCollectionList');
    try {
      return super.updateGamesCollectionList(gameSelected);
    } finally {
      _$_GamesCollectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGameFromGamesCollectionList(Map<String, dynamic> gameToRemove) {
    final _$actionInfo =
        _$_GamesCollectionControllerBaseActionController.startAction(
            name:
                '_GamesCollectionControllerBase.removeGameFromGamesCollectionList');
    try {
      return super.removeGameFromGamesCollectionList(gameToRemove);
    } finally {
      _$_GamesCollectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
needToOpenCollectionPageModal: ${needToOpenCollectionPageModal},
searchThingsFromBgg: ${searchThingsFromBgg},
isLoading: ${isLoading},
gamesCollectionList: ${gamesCollectionList}
    ''';
  }
}
