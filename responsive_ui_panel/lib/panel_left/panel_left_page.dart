import 'package:flutter/material.dart';
import 'package:responsive_ui_panel/constants.dart';
import 'package:responsive_ui_panel/panel_left/circle_graph.dart';
import 'package:responsive_ui_panel/panel_left/curved_chart.dart';
import 'package:responsive_ui_panel/responsive_layout.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  List<Todo> _toDo = [
    Todo(name: 'Comprar papél', enable: true),
    Todo(name: 'Repor estoque de microfones', enable: true),
    Todo(name: 'Contratar alguém', enable: true),
    Todo(name: 'Estratégia de Marketing', enable: true),
    Todo(name: 'Vender Móveis', enable: true),
    Todo(name: 'Finalizar divulgação', enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
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
                          'Produtos Vendidos',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '18% Vendidos',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            '4,500',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LineChartSample2(),
                PieChartSample2(),
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
                        _toDo.length,
                        (index) => CheckboxListTile(
                          title: Text(
                            _toDo[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _toDo[index].enable,
                          onChanged: (newValue) => setState(
                              () => _toDo[index].enable = newValue ?? true),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
