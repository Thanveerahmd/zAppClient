import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../../helper/constants/strings.dart";

class OrderSummary extends StatefulWidget {
  final bool isCourse;

  const OrderSummary({Key key, this.isCourse}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
      padding: EdgeInsets.only(top: _height * (45 / 812), left: _width * (29 / 375),right: _width * (29 / 375)),
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
                  onTap: () {
                    widget.isCourse ? _contentBloc.setNavigationHomeEvent.add(5) :_contentBloc.setNavigationHomeEvent.add(6);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                  ),
                ),
                SizedBox(width: _width * (12 / 375)),
                Text(
                  widget.isCourse ? "Course Payment" :"Order Summary",
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
          SizedBox(height: _height * (31 / 812)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Total",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
              SizedBox(width: _width * (38 / 375),),
              Text(
                "\$20.00",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
            ],
          ),
          SizedBox(height: _height * (12 / 812)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
              SizedBox(width: _width * (38 / 375),),
              Text(
                "\$00.00",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
            ],
          ),
          SizedBox(height: _height * (12 / 812)),
          Divider(
              color:_themeUtils.getColor(zappStrings.INACTIVE_ICON),
             thickness: 2,
          ),
          SizedBox(height: _height * (12 / 812)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
              SizedBox(width: _width * (38 / 375),),
              Text(
                "\$20.00",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: _height * 33/812),
              child:InkWell(
                onTap: () => widget.isCourse ? _contentBloc.setNavigationHomeEvent.add(10) : _contentBloc.setNavigationHomeEvent.add(9) ,
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
                  child: Center(child: Text("Proceed to Checkout",
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
    );
  }
}
