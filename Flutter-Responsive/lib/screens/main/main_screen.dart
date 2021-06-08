import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Este SideMenu deve ser exibido apenas em telas muito largas
            if (Responsive.isDesktop(context))
              Expanded(
                // flex padrão = 1
                // Este container ocupa 1/6 da tela
                child: SideMenu(),
              ),
            Expanded(
              // Este Container ocupa 5/6 da tela
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
// 39:53
