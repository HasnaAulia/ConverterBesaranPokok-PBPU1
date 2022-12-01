import 'package:unit_converter/unit_converter.dart';

class Time extends BaseQuantity<Time> {
  static final ConversionTree<Time> _tree = ConversionTree<Time>(
    data: ConversionNode<Time>(
      unit: TimeUnit.second,
      children: [
        ConversionNode<Time>(
          unit: TimeUnit.minute,
          coefficientProduct: 1 / 60,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.hour,
          coefficientProduct: 1 / 3600,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.day,
          coefficientProduct: 1 / 86400,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.week,
          coefficientProduct: 1 / 604800,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.month,
          coefficientProduct: 60 / 43800,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.year,
          coefficientProduct: 60 / 525600,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.decade,
          coefficientProduct: 3600 / 87600,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.century,
          coefficientProduct: 3600 / 876000,
        ),
      ],
    ),
  );
  Time(num value, Unit<Time> unit)
      : super(
          value: value,
          unit: unit,
        );

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
