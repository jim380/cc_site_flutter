import 'package:flutter/material.dart';

Widget sectionResponsiveBuilder(BuildContext context,
    BoxConstraints constraints, Function pageChildren, double ratioDenom) {
  if (constraints.maxWidth > 1200) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pageChildren(constraints.biggest.width),
    );
  } else if (constraints.maxWidth > 960 && constraints.maxWidth < 1200) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pageChildren(constraints.biggest.width / ratioDenom),
    );
  } else {
    return Column(
      children: pageChildren(constraints.biggest.width),
    );
  }
}
