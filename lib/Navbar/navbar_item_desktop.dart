import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import '../models/navbar_item.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
