import '../unit_converter.dart';
import 'dart:math';

class ElectricCurrent extends BaseQuantity<ElectricCurrent> {
  static final ConversionTree<ElectricCurrent> _tree =
      ConversionTree<ElectricCurrent>(
    data: ConversionNode<ElectricCurrent>(
      unit: ElectricCurrentUnit.ampere,
      children: [
        ConversionNode<ElectricCurrent>(
          unit: ElectricCurrentUnit.kiloampere,
          coefficientProduct: pow(10, -3),
        ),
        ConversionNode<ElectricCurrent>(
            unit: ElectricCurrentUnit.miliampere,
            coefficientProduct: pow(10, 3)),
        ConversionNode<ElectricCurrent>(
          unit: ElectricCurrentUnit.statampere,
          coefficientProduct: 2997924536.8,
        ),
      ],
    ),
  );

  ElectricCurrent(num value, Unit<ElectricCurrent> unit)
      : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<ElectricCurrent> to,
  ) {
    return Conversion<ElectricCurrent>(_tree)
        .convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits() {
    List<ConversionNode<ElectricCurrent>> nodes = _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<ElectricCurrent> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
