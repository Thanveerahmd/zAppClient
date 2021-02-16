// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/forgetPasswordBloc.dart';
import 'package:zapp_client/blocs/resetPasswordBloc.dart';
import 'package:zapp_client/blocs/setPasswordBloc.dart';
import 'package:zapp_client/blocs/setProfileImgBloc.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///forget password screen
class UploadProfilePictureScreen extends StatefulWidget {

  ///forget password screen constructor
  const UploadProfilePictureScreen({Key key}) : super(key: key);

  @override
  _UploadProfilePictureScreenState createState() => _UploadProfilePictureScreenState();
}

class _UploadProfilePictureScreenState extends State<UploadProfilePictureScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));
  //
  SetProfileImgBloc _setProfileImgBloc;
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    // super.didChangeDependencies();
    _setProfileImgBloc = Provider.of<SetProfileImgBloc>(context);
    // if (_prevStreamError != _forgetPasswordBloc.getError) {
    //   _prevStreamError = _forgetPasswordBloc.getError;
    //   _errorSubscription?.cancel();
    //   listenError(_forgetPasswordBloc.getError);
    // }
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
      body: Stack(
        children: [
          CustomPaint(
            painter:WaveDesign(),
            size: Size(_width,_height),
          ),
          ScrollConfiguration(
            behavior: ScrollGlowRemoved(),
            child: SingleChildScrollView(
              child: Container(
                height: _height,
                width: _width,
                child: Column(
                  children: [
                    SizedBox(height: _height*(77.24/812),),
                    Container(
                      width: _width * (285.88/375),
                      height: _height *(236.74/812),
                      child: Image.asset(PROFILE_PIC_IMG),
                    ),
                    SizedBox(height: _height*(144.02/812),),
                    Text("Upload a Profile Picture",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: _height*(11/812),),
                    Container(
                      width: _width * (325/375),
                      child: Center(
                        child: Text("Having a profile picture will help your instructor to identify you.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 15/812),
                      child: Text("Upload a Photo",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color:_themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: _height * 146/812),
                        child:InkWell(
                          onTap: () => Navigator.pushNamed(context, '/home'),
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
                            child: Center(child: Text("Get Started",
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveDesign extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 1.0;

    var path = Path();

    path.lineTo(0.0,430.0);
    path.cubicTo(size.width*(251/375), size.height*(269/812), size.width*(268.5/375), size.height*(474/812),size.width, size.height*(365.79/812),);
    path.lineTo(size.width,0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
