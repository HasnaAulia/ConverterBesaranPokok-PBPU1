import 'dart:math';

import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/mass_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class Mass extends BaseQuantity<Mass> {
  static final ConversionTree<Mass> _tree = ConversionTree<Mass>(
      data: ConversionNode<Mass>(unit: MassUnit.kilogram, children: [
    ConversionNode<Mass>(
      unit: MassUnit.gigagram,
      coefficientProduct: pow(10, -6),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.megagram,
      coefficientProduct: pow(10, -3),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.ton,
      coefficientProduct: pow(10, -3),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.hectogram,
      coefficientProduct: pow(10, 1),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.dekagram,
      coefficientProduct: pow(10, 2),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.gram,
      coefficientProduct: pow(10, 3),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.decigram,
      coefficientProduct: pow(10, 4),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.centigram,
      coefficientProduct: pow(10, 5),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.miligram,
      coefficientProduct: pow(10, 6),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.microgram,
      coefficientProduct: pow(10, 9),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.nanogram,
      coefficientProduct: pow(10, 12),
    ),
    ConversionNode<Mass>(
      unit: MassUnit.ounce,
      coefficientProduct: 35.274, 
    ),
    ConversionNode<Mass>(
      unit: MassUnit.pound,
      coefficientProduct: 2.205, 
    ),
  ]));

  Mass(num value, Unit<Mass> unit)
      : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<Mass> to,
  ) {
    return Conversion<Mass>(_tree).convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits(){
    List<ConversionNode<Mass>> nodes = _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<Mass> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
