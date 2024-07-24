import 'package:flutter/material.dart';

class DrawerTile extends StatefulWidget {
  final Function(String) onTap;
  final bool isExpanded;
  final IconData? leadingIcon;
  final String title;
  final String code;
  final bool isDense;
  const DrawerTile({
    super.key,
    required this.onTap,
    this.isExpanded = false,
    this.leadingIcon,
    required this.title,
    required this.code,
    this.isDense = false,
  });

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(widget.code),
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisAlignment: widget.isExpanded
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Icon(
              widget.leadingIcon,
              size: widget.isDense ? 20 : 24,
            ),
            if (widget.isExpanded)
              const SizedBox(
                width: 14,
              ),
            if (widget.isExpanded)
              Expanded(
                child: Text(
                  widget.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: widget.isDense ? 12 : 16,
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
