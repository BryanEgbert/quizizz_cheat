import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopTabletLayout;
  final Widget mobileLayout;

  ResponsiveWidget({this.desktopTabletLayout, this.mobileLayout});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        if(constraints.maxWidth > 800) {
          return desktopTabletLayout;
        }else {
          return mobileLayout;
        }
      }
    );
  }
}