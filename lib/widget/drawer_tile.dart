import 'package:adaptive_navrail/helpers/constants.dart';
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
      borderRadius: BorderRadius.circular(10),
      child: Tooltip(
        message: widget.menu.title,
        triggerMode: TooltipTriggerMode.longPress,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: widget.menu.code == widget.selectedMenuCode
              ? Theme.of(context).colorScheme.surfaceContainerHighest
              : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                      : null,
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
                        fontWeight: widget.menu.code == widget.selectedMenuCode
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: widget.isDense ? fontDense : fontNormal,
                        color: widget.menu.code == widget.selectedMenuCode
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
