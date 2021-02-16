
import 'package:flutter/material.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../helper/constants/strings.dart";

class ECardCodes extends StatelessWidget {

  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 403/812,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: _height * 34/812),
            child: Text("Your e-card codes",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _height * 11/812),
            child:  Container(
              width: _width * (327/375),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                  ),
                  labelText: 'ACLS Key Code',
                  hintText: 'ACLS Key Code',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _height * 11/812),
            child:  Container(
              width: _width * (327/375),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                  ),
                  labelText: 'BLS Key Code',
                  hintText: 'BLS Key Code',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _height * 11/812),
            child:  Container(
              width: _width * (327/375),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                  ),
                  labelText: 'PALS Key Code',
                  hintText: 'PALS Key Code',
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: _height * 24/812),
              child:InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: _height *(60/812),
                  width: _width * (327/375),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: new LinearGradient(
                      colors: [
                        _themeUtils.getColor(zappStrings.BUTTON_COLOUR2),
                        _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                      ],
                      begin: Alignment.centerRight,
                      end: new Alignment(-1.0, -1.0),
                    ),
                  ),
                  child: Center(child: Text("Visit Website & Verify",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    ),
                  )),
                ),
              )
          ),
        ],
      ),
    );
  }
}
