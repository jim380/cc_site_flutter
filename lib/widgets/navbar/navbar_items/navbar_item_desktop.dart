import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../models/navbar_item.dart';

class NavBarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
