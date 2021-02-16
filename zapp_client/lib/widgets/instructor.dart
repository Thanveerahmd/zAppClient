
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../helper/constants/strings.dart";
import 'expand_child.dart';

class Instructor extends StatefulWidget {
  final bool willingToTravel;

  const Instructor({Key key, this.willingToTravel}) : super(key: key);
  @override
  _InstructorState createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {

  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                        SizedBox(height: _width * 4 / 812,),
                        Row(
                          children: [
                            Container(
                              height: _width * 22 / 375,
                              width: _width * 53 / 375,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16.0) //                 <--- border radius here
                                ),
                                border: Border.all(
                                  color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "ACLS",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: _width * 4 / 375,),
                            Container(
                              height: _width * 22 / 375,
                              width: _width * 53 / 375,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16.0) //                 <--- border radius here
                                ),
                                border: Border.all(
                                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "BLS",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: _width * 4 / 375,),
                            Container(
                              height: _width * 22 / 375,
                              width: _width * 53 / 375,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16.0) //                 <--- border radius here
                                ),
                                border: Border.all(
                                  color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "PALS",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: _height * (15 / 812),),
          (widget.willingToTravel) ?
          Container(
            width: _width * 310 / 375,
            child: Stack(
              children: [
                Row(
                  children: [
                    SizedBox(width: _width * (143 / 375),),
                    Container(
                      width: _width * 145 / 375,
                      height: _height * 50 / 812,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                        border:  Border.all(
                          color:  _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          width: 2,
                        ) ,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Non-visiting",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                              ),
                            ),
                            Text(
                              "\$20.00",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: _width * 145 / 375,
                  height:  _height* 50 / 812,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                    border:  Border.all(
                      color:  _themeUtils.getColor(zappStrings.BORDER_COLOUR2),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Visiting",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                          ),
                        ),
                        Text(
                          "\$35.00",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Non-visiting instructor fee",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                ),
              ),
              SizedBox(width: _width * (38 / 375),),
              Text(
                "\$20.00",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                ),
              ),
            ],
          ),
          ExpandChild(
            arrowColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
            button: Padding(
                padding: EdgeInsets.only(top: _height * 12/812),
                child:Container(
                  height: _height *(39/812),
                  width: _width * (305/375),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    gradient: new LinearGradient(
                      colors: [
                        _themeUtils.getColor(zappStrings.BUTTON_COLOUR2),
                        _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                      ],
                      begin: Alignment.centerRight,
                      end: new Alignment(-1.0, -1.0),
                    ),
                  ),
                  child:Center(
                    child:  Text("Request Instructor",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                      ),
                    ),
                  ),
                )
            ),
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
                    child:Container(
                      height: _height *(39/812),
                      width: _width * (305/375),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        gradient: new LinearGradient(
                          colors: [
                            _themeUtils.getColor(zappStrings.BUTTON_COLOUR2),
                            _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                          ],
                          begin: Alignment.centerRight,
                          end: new Alignment(-1.0, -1.0),
                        ),
                      ),
                      child:Center(
                        child:  Text("Request Instructor",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
