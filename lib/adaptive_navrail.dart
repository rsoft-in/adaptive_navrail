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
  const AdaptiveNavrail({
    super.key,
    required this.drawerItems,
    required this.onDrawerTap,
    this.isExpanded = false,
    this.isDense = false,
  });

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
    // print('init value ${widget.isExpanded}');
    // if (!userInitiatedExpansion) {
    //   setState(() {
    //     isExpanded = isDesktop;
    //     print('init value chan $isExpanded');
    //   });
    // }

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
            Expanded(
              child: ListView.builder(
                itemCount: widget.drawerItems.length,
                itemBuilder: (context, index) {
                  final item = widget.drawerItems[index];
                  if (item.drawerItem.isEmpty) {
                    return DrawerTile(
                      onTap: widget.onDrawerTap,
                      code: item.code,
                      title: item.title,
                      isExpanded: isExpanded,
                      isDense: widget.isDense,
                      leadingIcon: item.icon,
                    );
                  } else {
                    return DrawerExpansionTile(
                      drawerItem: item,
                      onChildTap: (value) => widget.onDrawerTap(value),
                      title: item.title,
                      isExpanded: isExpanded,
                      isDense: widget.isDense,
                      leadingIcon: item.icon,
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
                    // userInitiatedExpansion = true;

                    isExpanded ? controller.forward() : controller.reverse();
                    print(isExpanded);
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
