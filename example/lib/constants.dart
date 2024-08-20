import 'package:flutter/material.dart';

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
        "title": "Contacts",
        "icon": Icons.contact_page_outlined,
      },
      {
        "code": "202",
        "title": "Mail",
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
        "title": "Shapes",
        "icon": Icons.category_outlined,
      },
      {
        "code": "302",
        "title": "Group",
        "icon": Icons.group_outlined,
      },
    ]
  },
  {
    "code": "400",
    "title": "Settings",
    "icon": Icons.settings_outlined,
    "expanded": false,
    "submenu": [],
  },
];
