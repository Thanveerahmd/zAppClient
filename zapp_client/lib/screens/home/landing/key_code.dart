import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../../../helper/constants/strings.dart";

class KeyCodes extends StatefulWidget {
  @override
  _KeyCodesState createState() => _KeyCodesState();
}

class _KeyCodesState extends State<KeyCodes> {
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
    return Container(
      padding: EdgeInsets.only(top: _height * (73 / 812), left: _width * (29 / 375)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _height * (73 / 812),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _contentBloc.setNavigationHomeEvent.add(1),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                  ),
                ),
                SizedBox(width: _width * (12 / 375)),
                Text(
                  "Add Your Heartcode\nCertificate Number",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollGlowRemoved(),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Container(
                     width: _width * (317 / 375),
                     child: ExpansionTile(
                       expandedCrossAxisAlignment: CrossAxisAlignment.start,
                       leading: Container(
                         width: _width * (70 / 375),
                         decoration: BoxDecoration(
                           color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                           borderRadius: const BorderRadius.only(
                             topLeft: const Radius.circular(10.0),
                             bottomLeft: const Radius.circular(10.0),
                           ),
                           boxShadow: [
                             const BoxShadow(
                               color: const Color(0xffD9E8FF),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: const Offset(2, 3),
                             ),
                           ],
                         ),
                         child: Center(
                           child: Container(
                             width: _width * (23.27/375),
                             height: _height *(16/812),
                             child: Image.asset(CHECK_ICON),
                           ),
                         ),
                       ),
                       title: Container(
                         child: Center(
                           child: Text(
                             "ACLS Certificate No.",
                             style: TextStyle(
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w600,
                               fontSize: 18,
                               color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                             ),
                           ),
                         ),
                       ),
                       children: [
                         Container(
                           height: _height * (179 / 812),
                           width: _width * (317 / 375),
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               bottomLeft: const Radius.circular(10.0),
                               bottomRight: const Radius.circular(10.0),
                             ),
                           ),
                           child: Column(
                             children: [
                               Padding(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ),
                                 child: Container(
                                   width: _width * (279/375),
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
                               Container(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ,left: _width * (18/375)),
                                 child: Row(
                                   children: [
                                     Container(
                                       width: _width * (104/375),
                                       height: _height *(49/812),
                                       child: Image.asset(UPLOAD_ICON),
                                     ),
                                     SizedBox(width:  _width * (22.5 / 375),),
                                     Container(
                                       width: _width * (1/375),
                                       height: _height *(49/812),
                                       child: Image.asset(LINE),
                                     ),
                                     SizedBox(width:  _width * (34.5 / 375),),
                                     Container(
                                       width: _width * (86/375),
                                       height: _height *(49/812),
                                       child: Image.asset(PHOTO_ICON),
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
                   SizedBox(height:  _height * (25/ 812),),
                   Container(
                     width: _width * (317 / 375),
                     child: ExpansionTile(
                       expandedCrossAxisAlignment: CrossAxisAlignment.start,
                       leading: Container(
                         width: _width * (70 / 375),
                         decoration: BoxDecoration(
                           color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                           borderRadius: const BorderRadius.only(
                             topLeft: const Radius.circular(10.0),
                             bottomLeft: const Radius.circular(10.0),
                           ),
                           boxShadow: [
                             const BoxShadow(
                               color: const Color(0xffD9E8FF),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: const Offset(2, 3),
                             ),
                           ],
                         ),
                         child: Center(
                           child: Container(
                             width: _width * (23.27/375),
                             height: _height *(16/812),
                             child: Image.asset(CHECK_ICON),
                           ),
                         ),
                       ),
                       title: Container(
                         child: Center(
                           child: Text(
                             "BLS Certificate No.",
                             style: TextStyle(
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w600,
                               fontSize: 18,
                               color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                             ),
                           ),
                         ),
                       ),
                       children: [
                         Container(
                           height: _height * (179 / 812),
                           width: _width * (317 / 375),
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               bottomLeft: const Radius.circular(10.0),
                               bottomRight: const Radius.circular(10.0),
                             ),
                           ),
                           child: Column(
                             children: [
                               Padding(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ),
                                 child: Container(
                                   width: _width * (279/375),
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
                               Container(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ,left: _width * (18/375)),
                                 child: Row(
                                   children: [
                                     Container(
                                       width: _width * (104/375),
                                       height: _height *(49/812),
                                       child: Image.asset(UPLOAD_ICON),
                                     ),
                                     SizedBox(width:  _width * (22.5 / 375),),
                                     Container(
                                       width: _width * (1/375),
                                       height: _height *(49/812),
                                       child: Image.asset(LINE),
                                     ),
                                     SizedBox(width:  _width * (34.5 / 375),),
                                     Container(
                                       width: _width * (86/375),
                                       height: _height *(49/812),
                                       child: Image.asset(PHOTO_ICON),
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
                   SizedBox(height:  _height * (25/ 812),),
                   Container(
                     width: _width * (317 / 375),
                     child: ExpansionTile(
                       expandedCrossAxisAlignment: CrossAxisAlignment.start,
                       leading: Container(
                         width: _width * (70 / 375),
                         decoration: BoxDecoration(
                           color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                           borderRadius: const BorderRadius.only(
                             topLeft: const Radius.circular(10.0),
                             bottomLeft: const Radius.circular(10.0),
                           ),
                           boxShadow: [
                             const BoxShadow(
                               color: const Color(0xffD9E8FF),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: const Offset(2, 3),
                             ),
                           ],
                         ),
                         child: Center(
                           child: Container(
                             width: _width * (23.27/375),
                             height: _height *(16/812),
                             child: Image.asset(CHECK_ICON),
                           ),
                         ),
                       ),
                       title: Container(
                         child: Center(
                           child: Text(
                             "PALS Certificate No.",
                             style: TextStyle(
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w600,
                               fontSize: 18,
                               color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                             ),
                           ),
                         ),
                       ),
                       children: [
                         Container(
                           height: _height * (179 / 812),
                           width: _width * (317 / 375),
                           decoration: BoxDecoration(
                             borderRadius: const BorderRadius.only(
                               bottomLeft: const Radius.circular(10.0),
                               bottomRight: const Radius.circular(10.0),
                             ),
                           ),
                           child: Column(
                             children: [
                               Padding(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ),
                                 child: Container(
                                   width: _width * (279/375),
                                   child: TextField(
                                     obscureText: false,
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
                               Container(
                                 padding:  EdgeInsets.only(top: _height * (19 / 812) ,left: _width * (18/375)),
                                 child: Row(
                                   children: [
                                     Container(
                                       width: _width * (104/375),
                                       height: _height *(49/812),
                                       child: Image.asset(UPLOAD_ICON),
                                     ),
                                     SizedBox(width:  _width * (22.5 / 375),),
                                     Container(
                                       width: _width * (1/375),
                                       height: _height *(49/812),
                                       child: Image.asset(LINE),
                                     ),
                                     SizedBox(width:  _width * (34.5 / 375),),
                                     Container(
                                       width: _width * (86/375),
                                       height: _height *(49/812),
                                       child: Image.asset(PHOTO_ICON),
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
                   Padding(
                       padding: EdgeInsets.only(top: _height * 38/812),
                       child:InkWell(
                         onTap: () => _contentBloc.setNavigationHomeEvent.add(3),
                         child: Container(
                           height: _height *(60/812),
                           width: _width * (315/375),
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
                               Text("Next: Search Instructor",
                                 style: TextStyle(
                                   fontFamily: 'Inter',
                                   fontWeight: FontWeight.w600,
                                   fontSize: 18,
                                   color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: _width * 29/375),
                                 child: Icon(
                                   Icons.arrow_forward_ios_sharp,
                                   color: Colors.white,
                                   size: 20.0,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )
                   ),
                 ],
               ),
             ),
         ),
          )
        ],
      ),
    );
  }
}
