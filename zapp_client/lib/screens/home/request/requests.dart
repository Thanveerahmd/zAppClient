// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";
import 'package:material_segmented_control/material_segmented_control.dart';

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/blocs/forgetPasswordBloc.dart';
import 'package:zapp_client/blocs/setAddressBloc.dart';
import 'package:zapp_client/helper/constants/enums.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/widgets/expand_child.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";
import 'active/active.dart';
import 'completed/completed.dart';
import 'pending/pending.dart';

///forget password screen
class Requests extends StatefulWidget {
  ///forget password screen constructor
  const Requests({Key key}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests>
    with SingleTickerProviderStateMixin {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  ContentBloc _contentBloc;
  @override
  void initState() {}

  void didChangeDependencies() {
    super.didChangeDependencies();
    _contentBloc = Provider.of<ContentBloc>(context);
  }


  @override
  void dispose() {
    super.dispose();
  }

  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;



  @override
  Widget build(BuildContext context) {

    Map<int, Widget> _children = {
      0: Text(
        "Active",
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      1: Text(
        "Pending",
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      2: Text(
        "Completed",
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    };

    return Scaffold(
      backgroundColor: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
      body: Container(
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
            Container(
              padding: EdgeInsets.only(top: _height * (27 / 812)),
              width:_width * (324 / 375) ,
              child: StreamBuilder(
                stream: _contentBloc.requestNavigationEvent,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  if(snapshot.data != null){
                    print("gjfgjf");
                  }else{
                    print("kela");
                  }
                  return MaterialSegmentedControl(
                    children: _children,
                    selectionIndex: snapshot.data ?? 0,
                    borderColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                    selectedColor: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                    unselectedColor: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                    borderRadius: 12.0,
                    onSegmentChosen: (index) => _contentBloc.setRequestNavigationEvent.add(index),
                  );
                }
              ),
            ),
            SizedBox(height: _height * (11 / 812),),
            Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollGlowRemoved(),
                  child: SingleChildScrollView(
                    child: StreamBuilder(
                      stream: _contentBloc.requestPageChanged,
                      initialData: RequestTabs.ACTIVE,
                      builder: (context, AsyncSnapshot<RequestTabs> snapshot) {
                        switch (snapshot.data) {
                          case RequestTabs.ACTIVE:
                            return Column(
                              children: [
                                Active(isComplete: false,),
                                SizedBox(height: _height * (15 / 812),),
                                Active(isComplete: true,),
                                SizedBox(height: _height * (15 / 812),),
                                Active(isComplete: false,),
                              ],
                            );
                          case RequestTabs.PENDING:
                            return Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Text(
                                  "Requests will expired in 30 mins",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                                  ),
                                ),
                                SizedBox(height: _height * (5 / 812),),
                                Pending(isExpired: false,),
                                SizedBox(height: _height * (15 / 812),),
                                Pending(isExpired: true,),
                                SizedBox(height: _height * (15 / 812),),
                                Pending(isExpired: false,),
                              ],
                            );
                          case RequestTabs.COMPLETED:
                            return Column(
                              children: [
                                Completed(),
                                SizedBox(height: _height * (15 / 812),),
                                Completed(),
                                SizedBox(height: _height * (15 / 812),),
                                Completed(),
                              ],
                            );
                          default:
                            return SizedBox.shrink();
                        }
                      },
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
