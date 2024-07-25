import 'package:adaptive_navrail/adaptive_navrail.dart';
import 'package:adaptive_navrail/models/drawer_item.dart';
import 'package:adaptive_navrail_example/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DrawerItem> drawerMenu = [];

  @override
  void initState() {
    drawerMenu =
        kMenu.map<DrawerItem>((json) => DrawerItem.fromJson(json)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveNavrail(
              isExpanded: true,
              isDense: true,
              drawerItems: drawerMenu,
              onDrawerTap: (value) {
                debugPrint('You selected $value');
              },
            ),
            Flexible(
                child: Column(
              children: [
                AppBar(
                  title: const Text('AdaptiveNavrail'),
                ),
                const ListTile(
                  title: Text('data'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
