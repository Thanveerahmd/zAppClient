/*Acts as a  fullscreen modal barrier that prohibits user interaction till a task is complete.*/

// Flutter imports:
import "package:flutter/material.dart";

///loading barrier widget
class LoadingBarrier extends StatelessWidget {

  ///loading barrier widget constructor
  const LoadingBarrier({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
      const Opacity(
          opacity: 0.5,
          child: const ModalBarrier(dismissible: false, color: Colors.transparent),
        ),
       const Center(
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

}
