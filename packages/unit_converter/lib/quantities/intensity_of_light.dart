import 'package:unit_converter/unit_converter.dart';

class IntensityOfLight extends BaseQuantity<IntensityOfLight> {
  static final ConversionTree<IntensityOfLight> _tree = ConversionTree(
    data: ConversionNode<IntensityOfLight>(
      unit: IntensityOfLightUnit.candela,
      children: [
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelaGerman,
          coefficientProduct: 95 / 100,
        ),
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelaUK,
          coefficientProduct: 90 / 100,
        ),
      ],
    ),
  );

  IntensityOfLight(
    num value,
    Unit<IntensityOfLight> unit,
  ) : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<IntensityOfLight> to,
  ) {
    return Conversion<IntensityOfLight>(_tree)
        .convert(super.value, super.unit, to);
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
