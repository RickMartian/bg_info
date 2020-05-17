import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final deviceWidth, deviceHeight;
  final index;
  final _games;
  final leftSide, rightSide;

  DetailsCard(this.deviceHeight, this.deviceWidth, this.index, this._games,
      this.leftSide, this.rightSide);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          10.0, 10.0, 10.0, index == _games.length - 1 ? 10.0 : 0.0),
      width: deviceWidth * 0.4,
      height: deviceHeight / 4,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: leftSide,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: rightSide,
              constraints: BoxConstraints.expand(),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
