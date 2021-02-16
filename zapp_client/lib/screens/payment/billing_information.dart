import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/helper/constants/enums.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';
import 'package:zapp_client/helper/general/utils.dart';
import "../../helper/constants/strings.dart";


class BillingInformation extends StatefulWidget {
  final bool isCourse;

  const BillingInformation({Key key, this.isCourse}) : super(key: key);

  @override
  _BillingInformationState createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {

  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  PaymentMethod _value = PaymentMethod.PAYPAL;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => widget.isCourse ? _contentBloc.setNavigationHomeEvent.add(8) : _contentBloc.setNavigationHomeEvent.add(7) ,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                  ),
                ),
                SizedBox(width: _width * (12 / 375)),
                Text(
                  "Billing Information",
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
                    padding: EdgeInsets.only(top: _height * 22/812),
                    child:  Container(
                      width: _width * (327/375),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0),
                            ),
                          ),
                          labelText: 'First Name',
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height * 11/812),
                    child:  Container(
                      width: _width * (327/375),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0),
                            ),
                          ),
                          labelText: 'Last Name',
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height * 11/812),
                    child:  Container(
                      width: _width * (327/375),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0),
                            ),
                          ),
                          labelText: 'E-mail Address',
                          hintText: 'E-mail Address',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: _height * (21/ 812),),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                    ),
                  ),
                  SizedBox(height: _height * (12 / 812),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: _height * (27 / 812),
                        width: _width * (27 / 375),
                        child: Radio(
                          value:PaymentMethod.PAYPAL,
                          groupValue: _value,
                          onChanged: (PaymentMethod value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width:  _width * (10 / 375),),
                      Text(
                        "Paypal",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: _height * (27 / 812),
                        width: _width * (27 / 375),
                        child: Radio(
                          value:PaymentMethod.STRIPE ,
                          groupValue: _value,
                          onChanged: (PaymentMethod value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width:  _width * (10 / 375),),
                      Text(
                        "Stripe",
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
                  Padding(
                    padding: EdgeInsets.only(top: _height * 11/812),
                    child:  Container(
                      width: _width * (327/375),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0),
                            ),
                          ),
                          labelText: 'Card Number',
                          hintText: 'Card Number',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: _height * (12 / 812),),
                  Text(
                    "Expiration Date",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: _themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                    ),
                  ),
                  SizedBox(height: _height * (12 / 812),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: _width * (50/375),
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            labelText: 'MM',
                          ),
                        ),
                      ),
                      SizedBox(width:  _width * (10 / 375),),
                      Container(
                        width: _width * (65/375),
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            labelText: 'YYYY',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height * 11/812),
                    child:  Container(
                      width: _width * (327/375),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(6.0),
                            ),
                          ),
                          labelText: 'CVV',
                          hintText: 'CVV',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height * 23/812),
                    child:Container(
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
                      child: Center(child: Text("Check out",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                        ),
                      )),
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
