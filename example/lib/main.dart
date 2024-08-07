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
  String selectedMenuCode = '';

  @override
  void initState() {
    drawerMenu =
        kMenu.map<DrawerItem>((json) => DrawerItem.fromJson(json)).toList();
    super.initState();
    selectedMenuCode = drawerMenu[0].code;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveNavrail(
              isExpanded: true,
              isDense: true,
              drawerItems: drawerMenu,
              selectedMenuCode: selectedMenuCode,
              header: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Example',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text('Welcome'),
                ],
              ),
              onDrawerTap: (value) {
                setState(() {
                  selectedMenuCode = value;
                });
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
                  title: Text('Welcome'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
