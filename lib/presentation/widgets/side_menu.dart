import 'package:finance_helper/core/dependency_injection/locator.dart';
import 'package:finance_helper/core/menu/menu_list.dart';
import 'package:finance_helper/presentation/home/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class SideMenu extends StatefulHookConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final NavigationService navigationService = locator<NavigationService>();

  SideMenu({super.key, required this.scaffoldKey});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final homeViewController = ref.read(homeViewProvider);

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        widget.navigationService.navigateTo(
          menuItem.link,
        );
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
        _LogoutButton(
            colors: colors, onPressed: homeViewController.goToLoginView),
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

class _LogoutButton extends StatefulHookConsumerWidget {
  final ColorScheme colors;
  final VoidCallback onPressed;

  const _LogoutButton({required this.colors, required this.onPressed});

  @override
  ConsumerState<_LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends ConsumerState<_LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text('Logout'),
      icon: Icon(Icons.logout_outlined, color: widget.colors.primary),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
