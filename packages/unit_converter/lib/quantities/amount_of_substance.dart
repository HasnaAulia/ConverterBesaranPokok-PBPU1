import 'dart:math';

import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/amount_of_substance_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class AmountOfSubstanceCurrent extends BaseQuantity<AmountOfSubstanceCurrent> {
  static final ConversionTree<AmountOfSubstanceCurrent> _tree =
      ConversionTree<AmountOfSubstanceCurrent>(
    data: ConversionNode<AmountOfSubstanceCurrent>(
      unit: AmountOfSubstanceUnit.mole,
      children: [
        ConversionNode<AmountOfSubstanceCurrent>(
          unit: AmountOfSubstanceUnit.kilomole,
          coefficientProduct: pow(10, -3),
        ),
        ConversionNode<AmountOfSubstanceCurrent>(
          unit: AmountOfSubstanceUnit.milimole,
          coefficientProduct: pow(10, 3),
        ),
        ConversionNode<AmountOfSubstanceCurrent>(
          unit: AmountOfSubstanceUnit.poundmole,
          coefficientProduct: 1 / 453.59237,
        ),
      ],
    ),
  );

  AmountOfSubstanceCurrent(num value, Unit<AmountOfSubstanceCurrent> unit)
      : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<AmountOfSubstanceCurrent> to,
  ) {
    return Conversion<AmountOfSubstanceCurrent>(_tree)
        .convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits() {
    List<ConversionNode<AmountOfSubstanceCurrent>> nodes =
        _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<AmountOfSubstanceCurrent> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
