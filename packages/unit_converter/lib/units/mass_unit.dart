import '../quantities/mass.dart';
import 'unit.dart';

enum MassUnit implements Unit<Mass> {
  kilogram('kg'),
  hectogram('hg'),
  dekagram('dag'),
  gram('g'),
  decigram('dg'),
  centigram('cg'),
  miligram('mg'),
  microgram('µg'),
  nanogram('ng'),
  megagram('Mg'),
  gigagram('Gg'),
  ounce('oz'),
  pound('lb'),
  ton('ton');

  const MassUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
