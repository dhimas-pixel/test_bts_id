import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation
    implements FloatingActionButtonLocation {
  final double offsetX;
  final double offsetY;
  final BuildContext context;
  const CustomFloatingActionButtonLocation({
    required this.offsetX,
    required this.offsetY,
    required this.context,
  });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(
      offsetX,
      offsetY - MediaQuery.of(context).padding.bottom,
    );
  }
}
