// // Flutter imports:
// import "package:flutter/material.dart";
//
// // Project imports:
// import "../helper/constants/strings.dart";
// import "../helper/constants/theme_utils.dart";
// import "../helper/general/utils.dart";
//
// ///custom text field widget
// class CustomTextField extends StatefulWidget {
//
//   ///custom text field widget constructor
//   const CustomTextField(
//       {this.keyboardType,
//         this.obscuredText = false,
//         this.hint,
//         this.stream,
//         this.sink,
//         Key key,}): super(key: key);
//
//   ///obscured text enable or not
//   final bool obscuredText;
//
//   ///keyboard type
//   final TextInputType keyboardType;
//
//   ///text field hint
//   final String hint;
//
//   ///stream
//   final Stream stream;
//
//   ///sink
//   final Sink sink;
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   final _height = Utils.totalBodyHeight;
//   final _width = Utils.bodyWidth;
//   final _themeUtils = ThemeUtils.getInstance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: _width * 0.066),
//         child: TextField(
//           keyboardType: widget.keyboardType,
//           cursorColor: Theme.of(context).primaryColor,
//           style: Theme.of(context).primaryTextTheme.headline4,
//           decoration: InputDecoration(
//             labelText: widget.hint,
//             labelStyle: Theme.of(context)
//                 .primaryTextTheme
//                 .headline3
//                 .copyWith(fontSize: 16),
//             contentPadding:
//             EdgeInsets.fromLTRB(0.0, 15.0, 10.0, _height * 0.009),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: _themeUtils.getColor(zappStrings.TEXT_FIELD_BORDER),
//                   width: 0.5),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: _themeUtils.getColor(zappStrings.TEXT_FIELD_BORDER)),
//             ),
//             errorBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: _themeUtils.getColor(zappStrings.TEXT_FIELD_BORDER),
//                   width: 0.5),
//             ),
//             focusedErrorBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: _themeUtils.getColor(zappStrings.ERROR_RED)),
//             ),
//           ),
//           obscureText: widget.obscuredText,
//           //onChanged: widget.sink.add,
//         ));
//   }
// }
