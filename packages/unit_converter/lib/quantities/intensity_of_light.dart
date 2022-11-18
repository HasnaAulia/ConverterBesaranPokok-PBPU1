import 'dart:math';

import 'package:unit_converter/unit_converter.dart';

import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/intensity_of_light_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class IntensityOfLight extends BaseQuantity<IntensityOfLight> {
  static final ConversionTree<IntensityOfLight> _tree = ConversionTree(
    data: ConversionNode<IntensityOfLight>(
      unit: IntensityOfLightUnit.candela,
      children: [
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelagerman,
          coefficientProduct: 95/100,
        ),
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelauk,
          coefficientProduct: 90/100,
        ),
      ],  
  ),
  );

  @override
  num convertTo(
    Unit<IntensityOfLight> to,
  ) {
    return Conversion<IntensityOfLight>(_tree).convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits() {
    List<ConversionNode<IntensityOfLight>> nodes = _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<IntensityOfLight> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
