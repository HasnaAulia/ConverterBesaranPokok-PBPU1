import '../quantities/luminous_intensity.dart';
import 'unit.dart';

enum LuminousIntensityUnit implements Unit<LuminousIntensity> {
  candela('cd'),
  candelaGerman('cd (German)'),
  candelaUK('cd (UK)');

  const LuminousIntensityUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
