// Dart imports:
import "dart:async";
import 'dart:ui' as ui;

// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  ContentBloc _contentBloc;
  bool isLoaded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
      body:Stack(
        children: [
          CustomPaint(
            painter:GradientDesign(),
            size: Size(_width,_height*170/812),
          ),
          CustomPaint(
            painter:BubbleDesign(),
            size: Size(_width,_height*197/812),
          ),
          Container(
            padding:  EdgeInsets.only(top:_height*17/812 ,left: _width * 29 / 375 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: _width * 300 / 375 ),
                  child: Container(
                    width: _width * (20.12/375),
                    height: _height *(20.12/812),
                    child: Image.asset(EDIT_ICON),
                  ),
                ),
                SizedBox(height: _height *(68.88/812),),
                Text("Archie ",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR5),
                  ),
                ), Text("Andrews ",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR5),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: _height*104/812,
            left: _width * 227.5/ 375,
            child:  Container(
              height:_height*95/812 ,
              width: _width * 95/375,
              decoration: BoxDecoration(
                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                  shape: BoxShape.circle,
                boxShadow: [
                  const BoxShadow(
                    color: const Color(0xffD9E8FF),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: CachedNetworkImage(
                  imageUrl:'',
                  imageBuilder: (context, imageProvider) => Container(
                    width: _height*88/812,
                    height:  _width * 88/375,
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
              ),
            ),
          ),
          Container(
            padding:  EdgeInsets.only(top:_height*221/812 ,left: _width * 24 / 375 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _width * 327/375,
                  height:_height*67/812 ,
                  decoration: BoxDecoration(
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffECEFF1),
                      width: 1,
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0xffD9E8FF),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.0,
                        child: Container(
                          width: _width * 82/375,
                          height:_height*67/812 ,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0),
                            ),
                             color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1).withOpacity(0.17),
                          ),
                          child: Center(
                            child: Container(
                              width: _width * (20/375),
                              height: _height *(16/812),
                              child: Image.asset(MAIL_ICON),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: _width * 245/375,
                        height:_height*67/812 ,
                        left: _width * 82/375,
                        child: Container(
                          child: Center(
                            child:  Text("archie.andrews@gmail.com",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:_height*12/812 ,),
                Container(
                  width: _width * 327/375,
                  height:_height*67/812 ,
                  decoration: BoxDecoration(
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffECEFF1),
                      width: 1,
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0xffD9E8FF),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.0,
                        child: Container(
                          width: _width * 82/375,
                          height:_height*67/812 ,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1).withOpacity(0.17),
                          ),
                          child: Center(
                            child: Container(
                              width: _width * (14/375),
                              height: _height *(20/812),
                              child: Image.asset(SMARTPHONE_ICON),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: _width * 245/375,
                        height:_height*67/812 ,
                        left: _width * 82/375,
                        child: Container(
                          child: Center(
                            child:  Text("+1-202-555-0161",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:_height*12/812 ,),
                Container(
                  width: _width * 327/375,
                  height:_height*67/812 ,
                  decoration: BoxDecoration(
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffECEFF1),
                      width: 1,
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0xffD9E8FF),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.0,
                        child: Container(
                          width: _width * 82/375,
                          height:_height*67/812 ,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1).withOpacity(0.17),
                          ),
                          child: Center(
                            child: Container(
                              width: _width * (20/375),
                              height: _height *(20/812),
                              child: Image.asset(PHONE_ICON),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: _width * 245/375,
                        height:_height*67/812 ,
                        left: _width * 82/375,
                        child: Container(
                          child: Center(
                            child:  Text("+1-202-555-0161",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:_height*12/812 ,),
                Container(
                  width: _width * 327/375,
                  height:_height*67/812 ,
                  decoration: BoxDecoration(
                    color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffECEFF1),
                      width: 1,
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: const Color(0xffD9E8FF),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.0,
                        child: Container(
                          width: _width * 82/375,
                          height:_height*67/812 ,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1).withOpacity(0.17),
                          ),
                          child: Center(
                            child: Container(
                              width: _width * (18/375),
                              height: _height *(22/812),
                              child: Image.asset(MAP_PIN_ICON),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: _width * 245/375,
                        height:_height*67/812 ,
                        left: _width * 82/375,
                        child: Container(
                          padding:  EdgeInsets.only(left: _width * 14 / 375 ),
                          child: Center(
                            child:  Text("936 Delaware St. Lancaster, NY 14086",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                            ),
                            color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ) ,
    );
  }

}
class GradientDesign extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final _themeUtils = ThemeUtils.getInstance;
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: <Color>[
        _themeUtils.getColor(zappStrings.HEADER_COLOUR1).withOpacity(0.8),
        _themeUtils.getColor(zappStrings.HEADER_COLOUR2).withOpacity(0.8),
      ],
      stops: [
        0.3,
        0.8,
      ],
    );
    Rect rect = new Rect.fromLTWH(0, 0, size.width, size.height);
    final Paint paint = new Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}

class BubbleDesign extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final _themeUtils = ThemeUtils.getInstance;

    Rect rect = new Rect.fromLTWH(0, 0, size.width, size.height);

    final Gradient gradient = new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: <Color>[
        _themeUtils.getColor(zappStrings.HEADER_COLOUR1).withOpacity(0.8),
        _themeUtils.getColor(zappStrings.HEADER_COLOUR2).withOpacity(0.8),
      ],
      stops: [
        0.3,
        0.8,
      ],
    );



    Paint paint_0 = new Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width,0);
    path_0.quadraticBezierTo(size.width,size.height*0.34,size.width,size.height*0.46);
    path_0.cubicTo(size.width*0.83,size.height*0.63,size.width*0.74,size.height*0.44,size.width*0.79,size.height*0.20);
    path_0.cubicTo(size.width*0.79,size.height*0.14,size.width*0.77,size.height*0.03,size.width*0.71,0);
    path_0.quadraticBezierTo(size.width*0.78,0,size.width,0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    var paint1 = Paint()
      ..color = Color(0xff03CCC1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(286, 97), 16, paint1);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}




