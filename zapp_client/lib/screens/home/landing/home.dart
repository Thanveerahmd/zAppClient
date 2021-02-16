// Dart imports:
import "dart:async";
import 'dart:ui';

// Flutter imports:
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

// Package imports:
import "package:flutter_svg/flutter_svg.dart";
import 'package:provider/provider.dart';

// Project imports:
import "../../../helper/constants/asset_paths.dart";
import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";
import "../../../helper/general/utils.dart";
import '../../../blocs/content_bloc.dart';
import 'certification.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  ContentBloc _contentBloc;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contentBloc = Provider.of<ContentBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(top: _height*(39/812),left: _width * (29/375)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: _width * (82/375),
                  height: _height *(32/812),
                  child: Image.asset(ZAPP_LOGO),
                ),
                SizedBox(width: _width*(211/375),),
                Container(
                  width: _width * (25/375),
                  height: _height *(25/812),
                  child: Image.asset(SEARCH_ICON),
                ),
              ],
            ),
            SizedBox(height: _height*(47/812),),
            Text("Hi Archie!",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
              ),
            ),
            SizedBox(height: _height*(6/812),),
            Text("What can we help you with ?",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
              ),
            ),
            SizedBox(height: _height*(39/812),),
            Container(
              width: _width * 317 / 375,
              height: _height* 149 / 812 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                border: Border.all(
                  color: const Color(0xffECEFF1),
                  width: 1,
                ),
                boxShadow: [
                  const BoxShadow(
                    color: const Color(0xffD9E8FF),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(top:_height*(21/812),left: _width * 21 / 375 ),
                child: Row(
                  children: [
                    Container(
                      width: _width * 261/375,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("I am ready have my skill test",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                            ),
                          ),
                          SizedBox(height: _height*(12/812),),
                          Expanded(
                            child: Text("I have completed the online AHA\nHeartcode course, have my certificate\nof completion and ready to have my\nskills test",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () => _contentBloc.setNavigationHomeEvent.add(1),
                        child: Center(child: Icon(Icons.arrow_forward_ios_sharp,color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),))),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:_height*(14/812) ),
              child: Container(
                width: _width * 317 / 375,
                height: _height* 149 / 812 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                  border: Border.all(
                    color: const Color(0xffECEFF1),
                    width: 1,
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: const Color(0xffD9E8FF),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top:_height*(21/812),left: _width * 21 / 375 ),
                  child: Row(
                    children: [
                      Container(
                        width: _width * 261/375,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("I need to purchase the online course",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                            SizedBox(height: _height*(12/812),),
                            Expanded(
                              child: Text("I have not completed an online AHA\nHeartcode course and I need to\npurchase the online course",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () => _contentBloc.setNavigationHomeEvent.add(6),
                          child: Center(child: Icon(Icons.arrow_forward_ios_sharp,color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),))),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:_height*(14/812) ),
              child: Container(
                width: _width * 317 / 375,
                height: _height* 149 / 812 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                  border: Border.all(
                    color: const Color(0xffECEFF1),
                    width: 1,
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: const Color(0xffD9E8FF),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top:_height*(21/812),left: _width * 21 / 375 ),
                  child: Container(
                    width: _width * 261/375,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text("I have purchased the online course\nbut have not completed the course. ",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                            ),
                          ),
                        ),
                        SizedBox(height: _height*(12/812),),
                        Expanded(
                          child: Text("Please come back later when you are\nready to test your skills",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
