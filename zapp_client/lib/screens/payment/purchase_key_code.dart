
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/blocs/paymentBloc.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/enums.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../../helper/constants/strings.dart";

class PurchaseKeyCode extends StatefulWidget {
  @override
  _PurchaseKeyCodeState createState() => _PurchaseKeyCodeState();
}

class _PurchaseKeyCodeState extends State<PurchaseKeyCode> {

  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  PurchaseBrand _value = PurchaseBrand.AMERICAN_HEART_ASSOCIATION;

  PaymentBloc _paymentBloc;
  ContentBloc _contentBloc;

  @override
  void didChangeDependencies() {
     super.didChangeDependencies();
     _paymentBloc = Provider.of<PaymentBloc>(context);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                onTap: () => _contentBloc.setNavigationHomeEvent.add(0),
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
          SizedBox(height: _height * (25 / 812),),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollGlowRemoved(),
              child: SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Purchase from:",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                      ),
                    ),
                    SizedBox(height: _height * (7 / 812),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: _height * (27 / 812),
                          width: _width * (27 / 375),
                          child: Radio(
                            value:PurchaseBrand.AMERICAN_HEART_ASSOCIATION ,
                            groupValue: _value,
                            onChanged: (PurchaseBrand value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width:  _width * (10 / 375),),
                        Text(
                          "American Heart Association",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: _height * (27 / 812),
                          width: _width * (27 / 375),
                          child: Radio(
                            value:PurchaseBrand.RED_CROSS ,
                            groupValue: _value,
                            onChanged: (PurchaseBrand value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width:  _width * (10 / 375),),
                        Text(
                          "Red Cross",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: _height * (13 / 812),),
                    Container(
                      width: _width * (317 / 375),
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
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                  height: _height * (156 / 812),
                                  child: CachedNetworkImage(
                                    imageUrl: '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          height: _height * 156 / 812,
                                          width: _width * 156 / 375,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(13),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (_, __) => Image.asset(
                                      TEMP_PIC_IMG2,
                                      width: 156,
                                      height: 156,
                                    ),
                                    errorWidget: (_, __, ___) => Image.asset(
                                      TEMP_PIC_IMG2,
                                      width: 156,
                                      height: 156,
                                    ),
                                  )),
                            ),
                            SizedBox(height: _height * (15 / 812),),
                            Text(
                              "American Heart Association 2020 HeartCode ACLS Online Key Code",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                            SizedBox(height: _height * (20 / 812),),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                            SizedBox(height: _height * (5 / 812),),
                            ReadMoreText(
                              'Heartcode ACLS is the AHA’s blended learning delivery method for the AHA’s ACLS Course. Blended learning is a combination of eLearning, in which a student completes part of the course in a self-directed manner, followed by a hands-on session. ',
                              trimLines: 4,
                              colorClickableText: _themeUtils.getColor(zappStrings.BORDER_COLOUR1),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'See more',
                              trimExpandedText: 'See less',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),
                            ),
                            SizedBox(height: _height * (12 / 812),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price:",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
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
                              padding: EdgeInsets.only(top: _height * 12/812),
                              child:  Container(
                                width: _width * (281/375),
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(6.0),
                                      ),
                                    ),
                                    labelText: 'Quantity',
                                    hintText: 'Quantity',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: _height * 33/812),
                        child:InkWell(
                          onTap: () =>  _contentBloc.setNavigationHomeEvent.add(7),
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
                            child: Center(child: Text("Buy Now",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                              ),
                            )),
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
