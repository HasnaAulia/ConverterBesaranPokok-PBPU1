import 'package:unit_converter/unit_converter.dart';

import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/time_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class Time extends BaseQuantity<Time> {
  static final ConversionTree<Time> _tree = ConversionTree<Time>(
    data: ConversionNode<Time>(
      unit: TimeUnit.second,
      children: [
        ConversionNode<Time>(
          unit: TimeUnit.minute,
          coefficientProduct: 1 / 60,
        ),
      ],
    ),
  );
  Time(num value, Unit<Time> unit)
      : super(
          value: value,
          unit: unit,
        ) {}

  @override
  num convertTo(
    Unit<Time> to,
  ) {
    return Conversion<Time>(_tree).convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits() {
    List<ConversionNode<Time>> nodes = _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<Time> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
