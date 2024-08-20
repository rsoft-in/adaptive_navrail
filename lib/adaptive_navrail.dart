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
  final Widget? header;
  final Widget? icon;
  final String selectedMenuCode;
  const AdaptiveNavrail({
    super.key,
    required this.drawerItems,
    required this.onDrawerTap,
    this.isExpanded = false,
    this.isDense = false,
    this.header,
    this.icon,
    required this.selectedMenuCode,
  });

  @override
  State<AdaptiveNavrail> createState() => _AdaptiveNavrailState();
}

class _AdaptiveNavrailState extends State<AdaptiveNavrail>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  bool isDesktop = false;
  bool userInitiatedExpansion = false;
  String selectedMenuCode = '';

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    isExpanded = widget.isExpanded;
    selectedMenuCode = widget.selectedMenuCode;
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
            if (widget.header != null || widget.icon != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    widget.icon ?? Container(),
                    if (isExpanded)
                      Expanded(child: widget.header ?? Container()),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.drawerItems.length,
                itemBuilder: (context, index) {
                  final menuItem = widget.drawerItems[index];
                  if (menuItem.subItems.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: DrawerTile(
                        onTap: (value) {
                          setState(() {
                            selectedMenuCode = value;
                          });
                          widget.onDrawerTap;
                        },
                        isExpanded: isExpanded,
                        isDense: widget.isDense,
                        menu: menuItem,
                        selectedMenuCode: selectedMenuCode,
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: DrawerExpansionTile(
                        onChildTap: (value) {
                          setState(() {
                            selectedMenuCode = value;
                          });
                          widget.onDrawerTap(value);
                        },
                        isExpanded: isExpanded,
                        isDense: widget.isDense,
                        menu: menuItem,
                        selectedMenuCode: selectedMenuCode,
                      ),
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
