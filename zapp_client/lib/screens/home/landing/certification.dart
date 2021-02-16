// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/blocs/forgetPasswordBloc.dart';
import 'package:zapp_client/blocs/setAddressBloc.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///forget password screen
class Certification extends StatefulWidget {
  ///forget password screen constructor
  const Certification({Key key}) : super(key: key);

  @override
  _CertificationState createState() => _CertificationState();
}

class _CertificationState extends State<Certification> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));

  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;
  ContentBloc _contentBloc;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contentBloc = Provider.of<ContentBloc>(context);
  }


  @override
  void dispose() {
  //  _errorSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.only(top: _height * (39 / 812), left: _width * (29 / 375)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: _width * (82 / 375),
                    height: _height * (32 / 812),
                    child: Image.asset(ZAPP_LOGO),
                  ),
                  SizedBox(
                    width: _width * (211 / 375),
                  ),
                  Container(
                    width: _width * (25 / 375),
                    height: _height * (25 / 812),
                    child: Image.asset(SEARCH_ICON),
                  ),
                ],
              ),
              SizedBox(
                height: _height * (47 / 812),
              ),
              Text(
                "Select certification(s) that you\nneed a skill test for.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:_height * (42 / 812) ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: _height * (94 / 812),
                      width: _width * (317 / 375),
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
                      child: ListTile(
                        leading: Radio(
                          activeColor:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          focusColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          value: 1,
                          groupValue: 0,
                          onChanged: (val){
                            print("value is $val");
                          },
                        ),
                        title: Text(
                          "ACLS",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        subtitle: Text(
                          "Advanced Cardiac Life Support",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        selected: false,
                      ),
                    ),
                    SizedBox(
                      height: _height * (18 / 812),
                    ),
                    Container(
                      height: _height * (94 / 812),
                      width: _width * (317 / 375),
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
                      child: ListTile(
                        leading: Radio(
                          activeColor:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          focusColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          value: 2,
                          groupValue: 2,
                          onChanged: (val){
                            print("value is $val");
                          },
                        ),
                        title: Text(
                          "BLS",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        subtitle: Text(
                          "Basic Life Support",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        selected: true,
                      ),
                    ),
                    SizedBox(
                      height: _height * (18 / 812),
                    ),
                    Container(
                      height: _height * (94 / 812),
                      width: _width * (317 / 375),
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
                      child: ListTile(
                        leading: Radio(
                          activeColor:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          focusColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          value: 3,
                          groupValue: 3,
                          onChanged: (val){
                            print("value is $val");
                          },
                        ),
                        title: Text(
                          "PALS",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        subtitle: Text(
                          "Paediatric Advance Life Support",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        selected: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _height * 100 / 812, left: _width * (235 / 375)),
                  child: InkWell(
                    onTap: () => _contentBloc.setNavigationHomeEvent.add(2),
                    child: Container(
                      height: _height * (60 / 812),
                      width: _width * (100 / 375),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next  ",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color:
                                  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
