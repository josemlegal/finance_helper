import 'package:finance_helper/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const String name = 'home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Finance Helper'),
        ),
        body: const Center(
          child: Text('Home View'),
        ),
        drawer: SideMenu(
          scaffoldKey: scaffoldKey,
        ));
  }
}
