import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_background.dart';
import 'package:flutter_app/widgets/horizontal_tab_layout.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Center(
            child: HorizontalTabLayout(),
          )
        ],
      ),
    );
  }

}