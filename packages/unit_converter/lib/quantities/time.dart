import 'dart:math';

import 'package:unit_converter/unit_converter.dart';

class Time extends BaseQuantity<Time> {
  static final ConversionTree<Time> _tree = ConversionTree<Time>(
    data: ConversionNode<Time>(
      unit: TimeUnit.day,
      children: [
        ConversionNode<Time>(
          unit: TimeUnit.hour,
          coefficientProduct: 24,
          children: [
            ConversionNode<Time>(
              unit: TimeUnit.minute,
              coefficientProduct: 24 * 60,
              children: [
                ConversionNode<Time>(
                  unit: TimeUnit.second,
                  coefficientProduct: 24 * pow(60, 2),
                ),
              ],
            ),
          ],
        ),
        ConversionNode<Time>(
          unit: TimeUnit.week,
          coefficientProduct: 1 / 7,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.month,
          coefficientProduct: 1 / 30.4167,
        ),
        ConversionNode<Time>(
          unit: TimeUnit.year,
          coefficientProduct: 1 / 365,
          children: [
            ConversionNode<Time>(
              unit: TimeUnit.decade,
              coefficientProduct: 1 / (365 * 10),
              children: [
                ConversionNode<Time>(
                  unit: TimeUnit.century,
                  coefficientProduct: 1 / (365 * 100),
                ),
              ],
            ),
          ],
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
}
