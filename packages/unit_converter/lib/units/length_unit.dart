import '../quantities/length.dart';
import 'unit.dart';

enum LengthUnit implements Unit<Length> {
  meter('m'),
  kilometer('km'),
  hectometer('hm'),
  dekameter('dam'),
  decimeter('dm'),
  centimeter('cm'),
  milimeter('mm'),
  micrometer('µm'),
  nanometer('nm'),
  gigameter('Gm'),
  megameter('Mm'),
  angstrom('Å'),
  inch('in'),
  foot('ft'),
  yard('yd'),
  mile('mi'),
  nauticalMile('nmi');

  const LengthUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
