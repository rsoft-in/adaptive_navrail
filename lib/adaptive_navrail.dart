// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:adaptive_navrail/helpers/adaptive.dart';
import 'package:adaptive_navrail/models/drawer_item.dart';
import 'package:adaptive_navrail/widget/drawer_expansion_tile.dart';
import 'package:adaptive_navrail/widget/drawer_tile.dart';
import 'package:flutter/material.dart';

/// Adaptive NavRail

class AdaptiveNavrail extends StatefulWidget {
  final List<DrawerItem> drawerItems;
  final Function(String) onDrawerTap;
  final bool isExpanded;
  final bool isDense;
  final Widget? icon;
  final String? title;
  final String? subTitle;
  const AdaptiveNavrail(
      {super.key,
      required this.drawerItems,
      required this.onDrawerTap,
      this.isExpanded = false,
      this.isDense = false,
      this.icon,
      this.title,
      this.subTitle});

  @override
  State<AdaptiveNavrail> createState() => _AdaptiveNavrailState();
}

class _AdaptiveNavrailState extends State<AdaptiveNavrail>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  bool isDesktop = false;
  bool userInitiatedExpansion = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    isExpanded = widget.isExpanded;
    if (isExpanded) controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDesktop = isDeviceLarge(context);
    setState(() {
      if (userInitiatedExpansion) {
        userInitiatedExpansion = false;
      } else {
        isExpanded = isDesktop;
        isExpanded ? controller.forward() : controller.reverse();
      }
    });

    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        duration: const Duration(milliseconds: 200),
        width: isExpanded ? 250 : 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null || widget.title != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    widget.icon ?? Container(),
                    if (isExpanded)
                      const SizedBox(
                        width: 8,
                      ),
                    if (isExpanded)
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.title != null)
                            Text(
                              widget.title ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          if (widget.subTitle != null)
                            Text(
                              widget.subTitle ?? '',
                              style: const TextStyle(fontSize: 12),
                            ),
                        ],
                      ))
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.drawerItems.length,
                itemBuilder: (context, index) {
                  final menuItem = widget.drawerItems[index];
                  if (menuItem.subItems.isEmpty) {
                    return DrawerTile(
                      onTap: widget.onDrawerTap,
                      isExpanded: isExpanded,
                      isDense: widget.isDense,
                      menu: menuItem,
                    );
                  } else {
                    return DrawerExpansionTile(
                      onChildTap: (value) => widget.onDrawerTap(value),
                      isExpanded: isExpanded,
                      isDense: widget.isDense,
                      menu: menuItem,
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: isExpanded ? Alignment.centerRight : Alignment.center,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    userInitiatedExpansion = true;
                    isExpanded ? controller.forward() : controller.reverse();
                  });
                },
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
