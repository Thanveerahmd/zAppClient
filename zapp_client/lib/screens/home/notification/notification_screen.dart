// Dart imports:
import "dart:async";
import 'dart:ui';

// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
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


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>{
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  ContentBloc _contentBloc;
  bool isLoaded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(top: _height*(32/812),left: _width * (25/375)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notifications",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
              ),
            ),
            SizedBox(height: _height*(19/812),),
            Text("Today",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
              ),
            ),
            SizedBox(height: _height*(5/812),),
            Container(
              width: _width * 327 / 375,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:'',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 53,
                        height: 53,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (_,__)=> Image.asset(
                        PROFILE_PIC_IMG,
                        width: 53,
                        height: 53,
                      ),
                      errorWidget: (_,__,___)=> Image.asset(
                        PROFILE_PIC_IMG,
                        width: 53,
                        height: 53,
                      ),
                    ),
                    Container(
                      padding:  EdgeInsets.only(left: _width * 15 / 375 ),
                      width: _width * 236/375,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bernard Lowe accepted your request. Make your payment to activate this appointment.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                            ),
                          ),
                          SizedBox(height: _height *(2/812),),
                          Container(
                            margin:  EdgeInsets.only(bottom: _height *(29/812)),
                            child: Row(
                              children: [
                                Container(
                                  width: _width * (14/375),
                                  height: _height *(14/812),
                                  child: Image.asset(CLOCK_ICON),
                                ),
                                SizedBox(width: _width * (5/375),),
                                Text("5m ago",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                                  ),
                                ),
                              ],

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
