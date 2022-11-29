import '../quantities/amount_of_substance.dart';
import 'unit.dart';

enum AmountOfSubstanceUnit implements Unit<AmountOfSubstanceCurrent> {
  mole('mol'),
  kilomole('kmol'),
  milimole('mmol'),
  poundmole('lb-mol');

  const AmountOfSubstanceUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
