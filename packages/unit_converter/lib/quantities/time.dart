import 'package:unit_converter/unit_converter.dart';

import '../units/unit.dart';
import 'base_quantity.dart';

class Time extends BaseQuantity<Time> {
  Time(num value, Unit<Time> unit)
      : super(
          value: value,
          unit: unit,
        ) {}

  @override
  num convertTo(
    Unit<Time> to,
  ) {
    return value;
  }
}
