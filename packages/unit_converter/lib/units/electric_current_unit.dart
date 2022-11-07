import '../quantities/electric_current.dart';
import 'unit.dart';

enum ElectricCurrentUnit implements Unit<ElectricCurrent> {
  ampere('A'),
  kiloampere('kA'),
  statampere('statA'),
  miliampere('mA');

  const ElectricCurrentUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
