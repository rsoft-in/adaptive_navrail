import 'package:adaptive_navrail/models/drawer_item.dart';
import 'package:adaptive_navrail/widget/drawer_tile.dart';
import 'package:flutter/material.dart';

class DrawerExpansionTile extends StatefulWidget {
  final bool isExpanded;
  final Function(String) onChildTap;
  final IconData? leadingIcon;
  final String title;
  final DrawerItem drawerItem;
  final bool initiallyExpanded;
  final bool isDense;
  const DrawerExpansionTile(
      {super.key,
      this.isExpanded = false,
      this.leadingIcon,
      required this.title,
      required this.drawerItem,
      required this.onChildTap,
      this.initiallyExpanded = false,
      this.isDense = false});

  @override
  State<DrawerExpansionTile> createState() => _DrawerExpansionTileState();
}

class _DrawerExpansionTileState extends State<DrawerExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return widget.isExpanded
        ? ExpansionTile(
            dense: widget.isDense,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            leading: Icon(
              widget.leadingIcon,
              size: widget.isDense ? 20 : 24,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            initiallyExpanded: widget.initiallyExpanded,
            children: widget.drawerItem.drawerItem
                .map((item) => DrawerTile(
                      code: item.code,
                      onTap: (value) => widget.onChildTap(item.code),
                      title: item.title,
                      isExpanded: widget.isExpanded,
                      leadingIcon: item.icon,
                      isDense: widget.isDense,
                    ))
                .toList(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              ...widget.drawerItem.drawerItem.map((item) => DrawerTile(
                    code: item.code,
                    onTap: (value) => widget.onChildTap(item.code),
                    title: item.title,
                    isExpanded: widget.isExpanded,
                    leadingIcon: item.icon,
                  )),
            ],
          );
  }
}
