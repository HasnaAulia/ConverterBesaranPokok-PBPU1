import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/electric_current_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class ElectricCurrent extends BaseQuantity<ElectricCurrent> {
  ElectricCurrent(num value, Unit<ElectricCurrent> unit)
      : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<ElectricCurrent> to,
  ) {
    return value;
  }
}
