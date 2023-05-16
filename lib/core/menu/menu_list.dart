import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Transactions',
      subTitle: 'Tx Page',
      icon: Icons.people_outlined,
      link: '/'),
  MenuItem(
      title: 'Settings',
      subTitle: 'Configuraciones de la app',
      icon: Icons.settings,
      link: '/settings-view'),
];
