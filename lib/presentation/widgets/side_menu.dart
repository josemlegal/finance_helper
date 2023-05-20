import 'package:finance_helper/core/menu/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        const _AccountHeader(),
        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
        const Divider(),
        _LogoutButton(colors: colors),
      ],
    );
  }
}

class _AccountHeader extends StatelessWidget {
  const _AccountHeader();

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      accountName: Text('Jose Martinez'),
      accountEmail: Text('josemlegal97@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage('https://picsum.photos/id/342/200/300'),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text('Logout'),
      icon: Icon(Icons.logout_outlined, color: colors.primary),
      onPressed: () {
        context.push(
          '/login-view',
        );
      },
    );
  }
}
