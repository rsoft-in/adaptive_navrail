# adaptive_navrail

A Simple Adaptive Navrail with one sub level menu. In expanded state it will use ExpansionTile to group the sub menus. In Navrail state it will show all submenus. You can individually select group of menus to be in expanded state initially.

## Getting Started

Create a menu in json format
'''
const kMenu = [
  {
    "code": "100",
    "title": "Dashboard",
    "icon": Icons.dashboard_outlined,
    "expanded": false,
    "submenu": [],
  },
  {
    "code": "200",
    "title": "Master",
    "icon": Icons.folder_outlined,
    "expanded": true,
    "submenu": [
      {
        "code": "201",
        "title": "Sub Menu 1",
        "icon": Icons.contact_page_outlined,
      },
      {
        "code": "202",
        "title": "Sub Menu 2",
        "icon": Icons.email_outlined,
      },
    ]
  },
  {
    "code": "300",
    "title": "Categories",
    "icon": Icons.folder_outlined,
    "expanded": false,
    "submenu": [
      {
        "code": "301",
        "title": "Sub Menu 1",
        "icon": Icons.category_outlined,
      },
      {
        "code": "302",
        "title": "Sub Menu 2",
        "icon": Icons.group_outlined,
      },
    ]
  }
]
'''

Map the JSON menu into Object model

'''
List<DrawerItem> drawerMenu = [];

@override
void initState() {
drawerMenu =
    kMenu.map<DrawerItem>((json) => DrawerItem.fromJson(json)).toList();
super.initState();
}
'''

Create the instance of AdaptiveNavrail

'''
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
                    title: Text('Welcome'),
                ),
                ],
            ))
            ],
        ),
        ),
    );
}
'''
