import 'package:adaptive_navrail/helpers/constants.dart';
import 'package:adaptive_navrail/models/drawer_item.dart';
import 'package:adaptive_navrail/widget/drawer_tile.dart';
import 'package:flutter/material.dart';

class DrawerExpansionTile extends StatefulWidget {
  final bool isExpanded;
  final Function(String) onChildTap;
  final DrawerItem menu;
  final bool isDense;
  const DrawerExpansionTile(
      {super.key,
      this.isExpanded = false,
      required this.menu,
      required this.onChildTap,
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
              widget.menu.icon,
              size: widget.isDense ? iconSizeDense : iconSizeNormal,
            ),
            title: Text(
              widget.menu.title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            initiallyExpanded: widget.menu.expanded,
            children: widget.menu.subItems
                .map((item) => DrawerTile(
                      onTap: (value) => widget.onChildTap(item.code),
                      isExpanded: widget.isExpanded,
                      isDense: widget.isDense,
                      menu: item,
                    ))
                .toList(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              ...widget.menu.subItems.map((item) => DrawerTile(
                    onTap: (value) => widget.onChildTap(item.code),
                    isExpanded: widget.isExpanded,
                    menu: item,
                  )),
            ],
          );
  }
}
