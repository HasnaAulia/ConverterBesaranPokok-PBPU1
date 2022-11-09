import '../quantities/base_quantity.dart';
import '../units/unit.dart';
import 'conversion_node.dart';
import 'conversion_tree.dart';

class Conversion<T extends BaseQuantity<T>> {
  final ConversionTree<T> tree;

  Conversion(this.tree);

  // apakah node 'node' mempunyai jalur dari root 'tree'
  bool _hasPath(
    ConversionNode<T> node,
    Unit<T> unit,
    List<ConversionNode<T>> nodesPath,
  ) {
    nodesPath.add(node);

    if (identical(node.unit, unit)) return true;

    for (ConversionNode<T> child in node.children) {
      if (_hasPath(child, unit, nodesPath)) return true;
    }

    nodesPath.removeLast();
    return false;
  }

  void _trimToLowestCommonAncestor(
    List<ConversionNode<T>> rootFromUnitPath,
    List<ConversionNode<T>> rootToUnitPath,
  ) {
    for (int i = 0;
        i <
            (rootFromUnitPath.length < rootToUnitPath.length
                    ? rootFromUnitPath.length
                    : rootToUnitPath.length) -
                1;
        i++) {
      if ((rootFromUnitPath.length < rootToUnitPath.length
              ? rootFromUnitPath.length
              : rootToUnitPath.length) <
          2) break;
      if (identical(rootFromUnitPath[i + 1], rootToUnitPath[i + 1])) {
        rootFromUnitPath.removeAt(i);
        rootToUnitPath.removeAt(i);
      } else {
        break;
      }
    }
  }

  num count(num value, List<ConversionNode<T>> path) {
    num result = value;
    for (int i = 0; i < path.length - 1; i++) {
      result = (result - path[i].coefficientSum) *
              path[i + 1].coefficientProduct /
              path[i].coefficientProduct +
          path[i + 1].coefficientSum;
    }
    return result;
  }

  num convert(num value, Unit<T> from, Unit<T> to) {
    num result = value;

    List<ConversionNode<T>> rootFromUnitPath = [];
    List<ConversionNode<T>> rootToUnitPath = [];

    if (_hasPath(tree.data, from, rootFromUnitPath) &&
        _hasPath(tree.data, to, rootToUnitPath)) {
      _trimToLowestCommonAncestor(rootFromUnitPath, rootToUnitPath);
      result = count(result, rootFromUnitPath.reversed.toList());
      result = count(result, rootToUnitPath);
    }

    return result;
  }
}
