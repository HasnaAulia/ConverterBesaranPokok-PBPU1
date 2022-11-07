import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/temperature_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class Temperature extends BaseQuantity<Temperature> {
  static final ConversionTree<Temperature> _tree = ConversionTree(
    data: ConversionNode<Temperature>(
      unit: TemperatureUnit.kelvin,
      coefficientSum: 273.15,
      children: [
        ConversionNode<Temperature>(
          unit: TemperatureUnit.celsius,
          children: [
            ConversionNode<Temperature>(
              unit: TemperatureUnit.fahrenheit,
              coefficientProduct: 9 / 5,
              coefficientSum: 32,
            ),
            ConversionNode<Temperature>(
              unit: TemperatureUnit.reaumur,
              coefficientProduct: 4 / 5,
            ),
          ],
        ),
        ConversionNode(unit: TemperatureUnit.reaumur)
      ],
    ),
  );

  Temperature(
    num value,
    Unit<Temperature> unit,
  ) : super(value: value, unit: unit);

  @override
  num convertTo(
    Unit<Temperature> to,
  ) {
    return Conversion(_tree).convert(value, unit, to);
  }
}
