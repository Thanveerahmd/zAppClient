import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/helper/general/utils.dart';
import 'package:zapp_client/widgets/checkbox.dart';
import "../../helper/constants/strings.dart";
import "package:maps_launcher/maps_launcher.dart";

class SearchInstructor extends StatefulWidget {
  @override
  _SearchInstructorState createState() => _SearchInstructorState();
}

class _SearchInstructorState extends State<SearchInstructor> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  void _pickDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 25));
    if (date != null) {
      // _addReservationBloc.setDate.add( DateFormat('yyyy-MM-dd').format(date));
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4220041, -122.0862462),
    zoom: 14.4746,
  );

  void _pickTime(bool isStartTime) async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (time != null) {
      //  (isStartTime) ? _addReservationBloc.setStartTime.add(time): _addReservationBloc.setEndTime.add(time);
    }
  }

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
      padding: EdgeInsets.only(top: _height * (45 / 812), left: _width * (29 / 375)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _height * (30 / 812),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _contentBloc.setNavigationHomeEvent.add(2),
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
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollGlowRemoved(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: _height * 24 / 812),
                      child: Container(
                        width: _width * (327 / 375),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            labelText: 'Preferred  Date',
                            hintText: 'Preferred  Date',
                            suffix: Container(
                              width: _width * (18 / 375),
                              height: _height * (20 / 812),
                              child: Image.asset(CALENDER_ICON),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 11 / 812),
                      child: Container(
                        width: _width * (327 / 375),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            labelText: 'Preferred  Time',
                            hintText: 'Preferred  Time',
                            suffix: Container(
                              width: _width * (20 / 375),
                              height: _height * (20 / 812),
                              child: Image.asset(CLOCK_ICON),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 11 / 812),
                      child: Text(
                        "Fee Range",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                        ),
                      ),
                    ),
                    FlutterSlider(
                      values: [20, 60],
                      rangeSlider: true,
                      max: 100,
                      min: 0,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        print(lowerValue);
                        print(upperValue);
                      },
                      handlerAnimation: FlutterSliderHandlerAnimation(
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.bounceIn,
                        duration: Duration(milliseconds: 500),
                        scale: 1,
                      ),
                      rightHandler: FlutterSliderHandler(
                        decoration: BoxDecoration(
                          color:
                              _themeUtils.getColor(zappStrings.RANGE_COLOUR1),
                          shape: BoxShape.circle,
                        ),
                        child: Container(),
                      ),
                      handler: FlutterSliderHandler(
                        decoration: BoxDecoration(
                          color:
                              _themeUtils.getColor(zappStrings.RANGE_COLOUR1),
                          shape: BoxShape.circle,
                        ),
                        child: Container(),
                      ),
                      trackBar: FlutterSliderTrackBar(
                        inactiveTrackBar: BoxDecoration(
                          color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                        ),
                        activeTrackBar: BoxDecoration(
                          color:
                              _themeUtils.getColor(zappStrings.RANGE_COLOUR1),
                        ),
                      ),
                      tooltip: FlutterSliderTooltip(
                        boxStyle: FlutterSliderTooltipBox(
                          decoration: BoxDecoration(
                            color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
                          ),
                        ) ,
                        alwaysShowTooltip: true,
                        textStyle: TextStyle(fontSize: 17, color: Colors.black),
                        positionOffset: FlutterSliderTooltipPositionOffset(
                          top: 60,
                        ),
                        leftPrefix: Icon(
                          Icons.attach_money,
                          size: 19,
                          color: Colors.black,
                        ),
                        rightPrefix: Icon(
                          Icons.attach_money,
                          size: 19,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: _height * 27 / 812),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                            },
                            child: TickBox(value: false,width:_width * (27 / 375) ,height: _height * (27 / 812),),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: _width * (12 / 375)),
                            child: Text(
                              "I am willing to travel",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 22 / 812),
                      child: Text(
                        "Distance Range",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                        ),
                      ),
                    ),
                    FlutterSlider(
                      values: [20, 60],
                      rangeSlider: true,
                      max: 100,
                      min: 0,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        print(lowerValue);
                        print(upperValue);
                      },
                      handlerAnimation: FlutterSliderHandlerAnimation(
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.bounceIn,
                        duration: Duration(milliseconds: 500),
                        scale: 1,
                      ),
                      rightHandler: FlutterSliderHandler(
                        decoration: BoxDecoration(
                          color:
                          _themeUtils.getColor(zappStrings.RANGE_COLOUR2),
                          shape: BoxShape.circle,
                        ),
                        child: Container(),
                      ),
                      handler: FlutterSliderHandler(
                        decoration: BoxDecoration(
                          color:
                          _themeUtils.getColor(zappStrings.RANGE_COLOUR2),
                          shape: BoxShape.circle,
                        ),
                        child: Container(),
                      ),
                      trackBar: FlutterSliderTrackBar(
                        inactiveTrackBar: BoxDecoration(
                          color: _themeUtils.getColor(zappStrings.TEXT_COLOUR4),
                        ),
                        activeTrackBar: BoxDecoration(
                          color:
                          _themeUtils.getColor(zappStrings.RANGE_COLOUR2),
                        ),
                      ),
                      tooltip: FlutterSliderTooltip(
                        boxStyle: FlutterSliderTooltipBox(
                          decoration: BoxDecoration(
                            color: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
                          ),
                        ) ,
                        alwaysShowTooltip: true,
                        textStyle: TextStyle(fontSize: 17, color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR3)),
                        positionOffset: FlutterSliderTooltipPositionOffset(
                          top: 60,
                        ),
                        leftSuffix:Text(
                          "miles",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ) ,
                        rightSuffix: Text(
                          "miles",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 52 / 812),
                      child: Container(
                        width: _width * (327 / 375),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            labelText: 'Confirm Location',
                            hintText: 'Confirm Location',
                            // suffix: Container(
                            //   width: _width * (18 / 375),
                            //   height: _height * (20 / 812),
                            //   child: Image.asset(CALENDER_ICON),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:  _height * 12 / 812,),
                    Container(
                      height: _height * 234.5/812,
                      width: _width*327/375,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),

                      // GoogleMap(
                      //   onTap: (_) => MapsLauncher.launchCoordinates(37.4220041, -122.0862462),
                      //   zoomControlsEnabled: false,
                      //   zoomGesturesEnabled: false,
                      //   scrollGesturesEnabled: false,
                      //   myLocationButtonEnabled: false,
                      //   initialCameraPosition: _kGooglePlex,
                      //   mapType: MapType.terrain,
                      //   onMapCreated: (GoogleMapController controller) {
                      //     },
                      // ),
                    ),
                    SizedBox(height:  _height * 19 / 812,),
                    InkWell(
                      onTap: () => _contentBloc.setNavigationHomeEvent.add(4),
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
                        child: Center(
                          child: Text("Search Now",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                            ),
                          ),
                        ),
                      ),
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
