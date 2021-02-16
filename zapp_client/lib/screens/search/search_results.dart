import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/helper/general/utils.dart';
import 'package:zapp_client/widgets/expand_child.dart';
import 'package:zapp_client/widgets/instructor.dart';
import "../../helper/constants/strings.dart";

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
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
      padding: EdgeInsets.only(top: _height * (43 / 812), left: _width * (29 / 375)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _height * (30 / 812),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _contentBloc.setNavigationHomeEvent.add(5),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                  ),
                ),
                SizedBox(width: _width * (12 / 375)),
                Text(
                  "Search Instructor",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                  ),
                ),
                SizedBox(width: _width * (100 / 375)),
                InkWell(
                  onTap: () => _contentBloc.setNavigationHomeEvent.add(3),
                  child: Container(
                    width: _width * (22 / 375),
                    height: _height * (18 / 812),
                    child: Image.asset(SLIDERS_ICON),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _height * (22 / 812)),
          Text(
            " 4 search results",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollGlowRemoved(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Instructor(willingToTravel: true,),
                    SizedBox(height: _height * (15 / 812),),
                    Instructor(willingToTravel: false,),
                    SizedBox(height: _height * (15 / 812),),
                    Instructor(willingToTravel: true,),
                    SizedBox(height: _height * (15 / 812),),
                    Instructor(willingToTravel: false,),
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
