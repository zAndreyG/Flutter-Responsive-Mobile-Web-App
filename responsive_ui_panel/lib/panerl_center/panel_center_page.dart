import 'package:flutter/material.dart';
import '../constants.dart';
import 'linear_graph.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  List<Person> _persons = [
    Person(name: 'Thelma Bowen', color: Constants.orangeLight),
    Person(name: 'Fernanda Odlard', color: Constants.redLight),
    Person(name: 'Victória Wilbert', color: Constants.blueLight),
    Person(name: 'Emerson Javier', color: Constants.orangeLight),
    Person(name: 'Neide Felicia', color: Constants.greenLight),
    Person(name: 'Amanda Clodes', color: Constants.orangeLight),
    Person(name: 'Emillie Huston', color: Constants.redLight),
    Person(name: 'Carlos Eduardo', color: Constants.blueLight),
    Person(name: 'Helder Evaristo', color: Constants.redLight),
    Person(name: 'Gabriel Bernardino', color: Constants.greenLight),
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
                      'Produtos Disponíveis',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '82% disponíveis',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        '25,500',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
              ),
              child: BarChartSample2(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        child: Text(
                          _persons[index].name.substring(0, 1),
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: _persons[index].color,
                      ),
                      title: Text(
                        _persons[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
