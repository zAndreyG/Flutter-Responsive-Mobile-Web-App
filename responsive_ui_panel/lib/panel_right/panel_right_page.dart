import 'package:flutter/material.dart';
import 'package:responsive_ui_panel/panel_right/wiggle_graph.dart';

import '../constants.dart';

class Product {
  String name;
  bool enable;
  Product({required this.name, this.enable = true});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: 'LED Luzes Submersiveis', enable: true),
    Product(name: 'Projetos Portátil', enable: true),
    Product(name: 'Microfone Bluetooth', enable: true),
    Product(name: 'Smart Watch', enable: true),
    Product(name: 'Tatuagens Temporárias', enable: true),
    Product(name: 'Livros', enable: true),
    Product(name: 'Processador de Vegetais', enable: true),
    Product(name: 'Massageador', enable: true),
    Product(name: 'Esfoliante Facial', enable: true),
    Product(name: 'Almofada', enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child: ListTile(
                    title: Text(
                      'Nova Receita',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '7% da média de vendas',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r'R$46.450',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample1(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                      _products.length,
                      (index) => SwitchListTile.adaptive(
                          title: Text(
                            _products[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _products[index].enable,
                          onChanged: (newValue) {
                            setState(() => _products[index].enable = newValue);
                          })),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 40:52