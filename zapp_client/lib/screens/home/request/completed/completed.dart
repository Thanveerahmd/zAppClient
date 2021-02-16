
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/utils.dart';
import 'package:zapp_client/widgets/e-cardCodes.dart';
import 'package:zapp_client/widgets/expand_child.dart';
import "../../../../helper/constants/strings.dart";

class Completed extends StatefulWidget {
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {

  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: _height * (15 / 812), left: _width * (11 / 375)),
      width: _width * (327 / 375),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
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
            offset: const Offset(
                2, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: _height * (65 / 812),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: '',
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          height: _height * 64 / 812,
                          width: _width * 64 / 375,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(13),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    placeholder: (_, __) => Image.asset(
                      TEMP_PIC_IMG,
                      width: 64,
                      height: 64,
                    ),
                    errorWidget: (_, __, ___) => Image.asset(
                      TEMP_PIC_IMG,
                      width: 64,
                      height: 64,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _width * (21 / 375)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bernard Lowe",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: _themeUtils.getColor(
                                zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                        Text(
                          "1 hour(s) away",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            color: _themeUtils.getColor(
                                zappStrings.TEXT_COLOUR4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: _height * (15 / 812),),
          Row(
            children: [
              Container(
                height: _width * 24 / 375,
                width: _width * 134 / 375,
                decoration: BoxDecoration(
                  color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                  borderRadius: BorderRadius.all(Radius.circular(16.0) //                 <--- border radius here
                  ),
                  border: Border.all(
                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "You are travelling",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    ),
                  ),
                ),
              ),
              SizedBox(width: _width * (97 / 375),),
              Text(
                "\$20.00",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
            ],
          ),
          SizedBox(height: _height * (11 / 812),),
          ExpandChild(
            arrowColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
            button: InkWell(
              onTap: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13.0))
                    ),
                    content: ECardCodes(),
                  );
                }
                );
              },
              child: Container(
                height: _height *(39/812),
                width: _width * (305/375),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  border: Border.all(color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1)),
                ),
                child:Center(
                  child:  Text("e-card Code(s)",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                    ),
                  ),
                ),
              ),
            ) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: _height *(54/812),
                  child: Row(
                    children: [
                      Container(
                        width: _width * (18/375),
                        height: _height *(22/812),
                        child: Image.asset(MAP_PIN_ICON2),
                      ),
                      SizedBox(width: _width * (11/375),),
                      Expanded(
                        child: Text("936 Delaware St. Lancaster, NY 14086",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: _width * (20/375),
                      height: _height *(20/812),
                      child: Image.asset(PHONE_ICON2),
                    ),
                    SizedBox(width: _width * (11/375),),
                    Text("+1-202-555-0161",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 12/812),
                  child:
                  Container(
                    height: _height *(39/812),
                    width: _width * (305/375),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      border: Border.all(color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1)),
                    ),
                    child:Center(
                      child:  Text("e-card Code(s)",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                        ),
                      ),
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
