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
              header: Material(
                color: Theme.of(context).colorScheme.primaryFixed,
                borderRadius: BorderRadius.circular(10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Row(
                    children: [
                      FlutterLogo(
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AdaptiveNavrail',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text('Example'),
                        ],
                      ),
                    ],
                  ),
                ),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Item $index'),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
