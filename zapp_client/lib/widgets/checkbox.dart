import 'package:flutter/material.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import "../helper/constants/strings.dart";

class TickBox extends StatelessWidget {
  final _themeUtils = ThemeUtils.getInstance;

  final bool value;
  final double width;
  final double height;

  TickBox({Key key, this.value, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return value
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: _themeUtils.getColor(zappStrings.BORDER_COLOUR1),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR1),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: 20.0,
                color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
              ),
            ),
          )
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
            ),
            child: Container(),
          );
  }
}
