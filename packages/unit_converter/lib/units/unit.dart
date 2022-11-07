import '../quantities/base_quantity.dart';

abstract class Unit<T extends BaseQuantity<T>> {
  String get symbol;
}
