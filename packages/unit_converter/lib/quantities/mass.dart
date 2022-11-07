import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/mass_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class Mass extends BaseQuantity<Mass> {
  Mass(num value, Unit<Mass> unit)
      : super(
          value: value,
          unit: unit,
        ) {}

  @override
  num convertTo(
    Unit<Mass> to,
  ) {
    return value;
  }
}
