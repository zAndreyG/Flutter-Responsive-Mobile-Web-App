import 'package:flutter/material.dart';
import 'package:responsive_ui_panel/constants.dart';
import 'package:responsive_ui_panel/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtomInfo {
  String title;
  IconData icon;

  ButtomInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtomInfo> _buttomNames = [
  ButtomInfo(title: 'Home', icon: Icons.home),
  ButtomInfo(title: 'Configurações', icon: Icons.settings),
  ButtomInfo(title: 'Notificações', icon: Icons.notifications),
  ButtomInfo(title: 'Contatos', icon: Icons.contact_phone_rounded),
  ButtomInfo(title: 'Vendas', icon: Icons.sell),
  ButtomInfo(title: 'Marketing', icon: Icons.mark_email_read),
  ButtomInfo(title: 'Segurança', icon: Icons.verified_user),
  ButtomInfo(title: 'Usuários', icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Menu de Administação",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
              ),
              ...List.generate(
                _buttomNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.orangenDark.withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttomNames[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttomNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () => setState(() => _currentIndex = index),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
