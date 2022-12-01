import '../quantities/intensity_of_light.dart';
import 'unit.dart';

enum IntensityOfLightUnit implements Unit<IntensityOfLight> {
  candela('cd'),
  candelaGerman('cd g'),
  candelaUK('cd uk');

  const IntensityOfLightUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
