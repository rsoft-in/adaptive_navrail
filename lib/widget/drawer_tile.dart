import 'package:adaptive_navrail/helpers/constants.dart';
import 'package:adaptive_navrail/helpers/extensions.dart';
import 'package:adaptive_navrail/models/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatefulWidget {
  final Function(String) onTap;
  final bool isExpanded;
  final bool isDense;
  final DrawerItem menu;
  final String selectedMenuCode;
  const DrawerTile(
      {super.key,
      required this.onTap,
      this.isExpanded = false,
      this.isDense = false,
      required this.menu,
      required this.selectedMenuCode});

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.menu.code);
        setState(() {});
      },
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisAlignment: widget.isExpanded
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Icon(
              widget.menu.icon,
              size: widget.isDense ? iconSizeDense : iconSizeNormal,
              color: widget.menu.code == widget.selectedMenuCode
                  ? Theme.of(context).colorScheme.primary
                  : (context.isDarkMode ? Colors.white : Colors.black),
            ),
            if (widget.isExpanded)
              const SizedBox(
                width: 14,
              ),
            if (widget.isExpanded)
              Expanded(
                child: Text(
                  widget.menu.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: widget.isDense ? fontDense : fontNormal,
                    color: widget.menu.code == widget.selectedMenuCode
                        ? Theme.of(context).colorScheme.primary
                        : (context.isDarkMode ? Colors.white : Colors.black),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
