import 'package:flutter/material.dart';
import 'package:flutter_app/model/forum.dart';
import 'package:flutter_app/styleguide/text_styles.dart';
import 'package:flutter_app/widgets/label_value_widget.dart';

class ForumDetailsWidget extends StatelessWidget {
  final Forum forum;

  ForumDetailsWidget({this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DetailsCustomClipper(),
      child: Container(
        height: 180.0,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 16.0,
          top: 24.0,
          bottom: 12.0
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0
                      ),
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Text(
                        forum.rank,
                        style: rankStyle,
                      ),
                    ),
                  ),
                  Text("new", style: labelTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: forum.topics.length.toString(),
                  label: "topics",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "threads",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "subs",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DetailsCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height / 2;
    final double width = size.width;

    Path clippedPath = Path();

    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall, height - controlPointDistanceFromWall, 0 + distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 0 + 30.0);
    clippedPath.quadraticBezierTo(width - 5, 0 + 5.0, width - 35, 0 + 15.0);
    clippedPath.close();

    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }

}