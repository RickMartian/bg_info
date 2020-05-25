// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagesController on _PagesController, Store {
  final _$currentPageAtom = Atom(name: '_PagesController.currentPage');

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

  final _$_PagesControllerActionController =
      ActionController(name: '_PagesController');

  @override
  void changeCurrentPage(int newPage) {
    final _$actionInfo = _$_PagesControllerActionController.startAction(
        name: '_PagesController.changeCurrentPage');
    try {
      return super.changeCurrentPage(newPage);
    } finally {
      _$_PagesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
