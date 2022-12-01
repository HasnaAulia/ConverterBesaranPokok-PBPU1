import 'dart:math';

import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/amount_of_substance_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class AmountOfSubstance extends BaseQuantity<AmountOfSubstance> {
  static final ConversionTree<AmountOfSubstance> _tree =
      ConversionTree<AmountOfSubstance>(
    data: ConversionNode<AmountOfSubstance>(
      unit: AmountOfSubstanceUnit.mole,
      children: [
        ConversionNode<AmountOfSubstance>(
          unit: AmountOfSubstanceUnit.kilomole,
          coefficientProduct: pow(10, -3),
        ),
        ConversionNode<AmountOfSubstance>(
          unit: AmountOfSubstanceUnit.milimole,
          coefficientProduct: pow(10, 3),
        ),
        ConversionNode<AmountOfSubstance>(
          unit: AmountOfSubstanceUnit.poundmole,
          coefficientProduct: 1 / 453.59237,
        ),
      ],
    ),
  );

  AmountOfSubstance(num value, Unit<AmountOfSubstance> unit)
      : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<AmountOfSubstance> to,
  ) {
    return Conversion<AmountOfSubstance>(_tree)
        .convert(super.value, super.unit, to);
  }
}
