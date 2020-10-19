import 'package:flutter/material.dart';
import 'package:flutter_covid_19/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Palette.primaryColor,
      leading:
          IconButton(icon: Icon(Icons.menu), iconSize: 30, onPressed: () {}),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications_none),
            iconSize: 30,
            onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
