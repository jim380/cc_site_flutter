import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../models/navbar_item.dart';

class NavBarItemMobile extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(model.iconData),
          SizedBox(
            width: 30,
          ),
          Text(
            model.title!,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
