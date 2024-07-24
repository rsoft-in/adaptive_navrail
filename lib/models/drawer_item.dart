import 'package:flutter/material.dart';

class DrawerItem {
  String code;
  String title;
  IconData icon;
  List<DrawerItem> drawerItem;
  DrawerItem(this.code, this.title, this.icon, this.drawerItem);
  DrawerItem.fromJson(Map<String, dynamic> parsed)
      : code = parsed['code'],
        title = parsed['title'],
        icon = parsed['icon'],
        drawerItem = ((parsed['submenu'] ?? []) as List)
            .map((e) => DrawerItem.fromJson(e))
            .toList();
}
