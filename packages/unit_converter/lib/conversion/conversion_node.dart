import '../quantities/base_quantity.dart';
import '../units/unit.dart';

class ConversionNode<T extends BaseQuantity<T>> {
  final Unit<T> unit;
  final num coefficientProduct;
  final num coefficientSum;
  final List<ConversionNode<T>> children;

  ConversionNode({
    required this.unit,
    this.coefficientProduct = 1.0,
    this.coefficientSum = 0.0,
    this.children = const [],
  });

  @override
  String toString() {
    return unit.symbol;
  }

  List<ConversionNode<T>> getTreeAsList() {
    List<ConversionNode<T>> result = [this];
    for (ConversionNode<T> node in children) {
      result = [...result, ...node.getTreeAsList()];
    }
    return result;
  }
}
