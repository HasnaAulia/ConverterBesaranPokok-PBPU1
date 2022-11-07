import '../quantities/base_quantity.dart';
import '../units/unit.dart';
import 'conversion_node.dart';

class ConversionTree<T extends BaseQuantity<T>> {
  final ConversionNode<T> data;

  ConversionTree({required this.data});
}
