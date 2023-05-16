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
      link: '/transactions-view'),
  MenuItem(
      title: 'Settings',
      subTitle: 'Configuraciones de la app',
      icon: Icons.settings_outlined,
      link: '/settings-view'),
  MenuItem(
      title: 'Home',
      subTitle: 'Home de la app',
      icon: Icons.home_max_outlined,
      link: '/home-view'),
  MenuItem(
      title: 'Dashboard',
      subTitle: 'Dashboard',
      icon: Icons.dashboard_outlined,
      link: '/dashboard-view'),
];
