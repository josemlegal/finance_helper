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
      title: 'Home',
      subTitle: 'Bienvenido a Finance Helper.',
      icon: Icons.home_rounded,
      link: '/home-view'),
  MenuItem(
      title: 'Transactions',
      subTitle: 'Controla tus ingresos/egresos.',
      icon: Icons.people_outlined,
      link: '/transactions-view'),
  MenuItem(
      title: 'Dashboard',
      subTitle: 'Resumen de tus finanzas.',
      icon: Icons.dashboard_outlined,
      link: '/dashboard-view'),
  MenuItem(
      title: 'Settings',
      subTitle: 'Configuraciones de la app.',
      icon: Icons.settings_outlined,
      link: '/settings-view'),
];
