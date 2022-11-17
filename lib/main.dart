import 'package:flutter/material.dart';
import 'package:unit_converter/unit_converter.dart';

import 'package_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Package Testing",
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.linear_scale),
                text: 'Panjang',
              ),
              Tab(
                icon: Icon(Icons.balance),
                text: 'Massa',
              ),
              Tab(
                icon: Icon(Icons.thermostat),
                text: 'Suhu',
              ),
              Tab(
                icon: Icon(Icons.timer),
                text: 'Waktu',
              ),
              Tab(
                icon: Icon(Icons.electric_bolt),
                text: 'Kuat Arus Listrik',
              ),
              Tab(
                icon: Icon(Icons.electric_bolt),
                text: 'Intensitas Cahaya',
              ),
              Tab(
                icon: Icon(Icons.electric_bolt),
                text: 'Jumlah Zat',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PackageTesting(unitList: LengthUnit.values),
            PackageTesting(unitList: MassUnit.values),
            PackageTesting(unitList: TemperatureUnit.values),
            PackageTesting(unitList: TimeUnit.values),
            PackageTesting(unitList: ElectricCurrentUnit.values),
            PackageTesting(unitList: LengthUnit.values),
            PackageTesting(unitList: LengthUnit.values),
          ],
        ),
      ),
    );
  }
}
