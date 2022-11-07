import 'package:unit_converter/unit_converter.dart';

abstract class BaseQuantity<T extends BaseQuantity<T>> {
  final num value;
  final Unit<T> unit;

  BaseQuantity({
    required this.value,
    required this.unit,
  });

  num convertTo(
    Unit<T> to,
  );
}
