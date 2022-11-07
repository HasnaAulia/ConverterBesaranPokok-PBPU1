import '../quantities/base_quantity.dart';
import '../units/unit.dart';
import 'conversion_node.dart';
import 'conversion_tree.dart';

class Conversion<T extends BaseQuantity<T>> {
  final ConversionTree<T> tree;

  Conversion(this.tree);

  ConversionNode<T> _findNodeOfCorrespondingUnit(
    Unit<T> unit,
    ConversionNode<T> node,
  ) {
    if (unit == node.unit) return node;

    for (ConversionNode<T> child in node.children) {
      ConversionNode<T> result = _findNodeOfCorrespondingUnit(unit, child);
      if (unit == result.unit) return result;
    }
    return node;
  }

  // apakah node 'node' mempunyai jalur dari root 'tree'
  bool _hasPath(
    ConversionNode<T> root,
    ConversionNode<T> node,
    List<ConversionNode<T>> nodesPath,
  ) {
    nodesPath.add(root);

    if (identical(root.unit, node.unit)) return true;

    for (ConversionNode<T> child in root.children) {
      if (_hasPath(child, node, nodesPath)) return true;
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

    ConversionNode<T> fromNode = _findNodeOfCorrespondingUnit(from, tree.data);
    ConversionNode<T> toNode = _findNodeOfCorrespondingUnit(to, tree.data);

    if (_hasPath(tree.data, fromNode, rootFromUnitPath) &&
        _hasPath(tree.data, toNode, rootToUnitPath)) {}
    _trimToLowestCommonAncestor(rootFromUnitPath, rootToUnitPath);

    result = count(result, rootFromUnitPath.reversed.toList());
    result = count(result, rootToUnitPath);

    return result;
  }
}
