import 'package:flutter/material.dart';

class DrawerItem {
  String code;
  String title;
  IconData icon;
  bool expanded;
  List<DrawerItem> subItems;
  DrawerItem(this.code, this.title, this.icon, this.subItems, this.expanded);
  DrawerItem.fromJson(Map<String, dynamic> parsed)
      : code = parsed['code'],
        title = parsed['title'],
        icon = parsed['icon'],
        expanded = parsed['expanded'] ?? false,
        subItems = ((parsed['submenu'] ?? []) as List)
            .map((e) => DrawerItem.fromJson(e))
            .toList();
}
