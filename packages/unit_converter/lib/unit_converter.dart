library unit_converter;

import 'dart:math';

abstract class BaseQuantity<T extends BaseQuantity<T>> {
  num convertTo(
    Unit<T> to,
  );
}

class Length extends BaseQuantity<Length> {
  final num value;
  final Unit<Length> unit;

  Length(this.value, this.unit);

  @override
  num convertTo(
    Unit<Length> to,
  ) {
    return Conversion(LengthConversionTree.tree).convert(value, unit, to);
  }
}

class Mass extends BaseQuantity<Mass> {
  final num value;
  final Unit<Length> unit;

  Mass(this.value, this.unit);

  @override
  num convertTo(
    Unit<Mass> to,
  ) {
    return value;
  }
}

class Time extends BaseQuantity<Time> {
  final num value;
  final Unit<Time> unit;

  Time(this.value, this.unit);

  @override
  num convertTo(
    Unit<Time> to,
  ) {
    return value;
  }
}

class Temperature extends BaseQuantity<Temperature> {
  final num value;
  final Unit<Temperature> unit;

  Temperature(this.value, this.unit);

  @override
  num convertTo(
    Unit<Temperature> to,
  ) {
    return value;
  }
}

class ElectricCurrent extends BaseQuantity<ElectricCurrent> {
  final num value;
  final Unit<ElectricCurrent> unit;

  ElectricCurrent(this.value, this.unit);

  @override
  num convertTo(
    Unit<ElectricCurrent> to,
  ) {
    return value;
  }
}

abstract class Unit<T extends BaseQuantity<T>> {
  String get getSymbol;
}

enum LengthUnit implements Unit<Length> {
  meter('m'),
  kilometer('km'),
  hectometer('hm'),
  dekameter('dam'),
  decimeter('dm'),
  centimeter('cm'),
  milimeter('mm'),
  micrometer('µm'),
  nanometer('nm'),
  gigameter('Gm'),
  megameter('Mm'),
  angstrom('Å'),
  inch('in'),
  foot('ft'),
  yard('yd'),
  mile('mi'),
  nauticalMile('nmi');

  const LengthUnit(this.symbol);

  final String symbol;

  @override
  String get getSymbol => symbol;
}

enum MassUnit implements Unit<Mass> {
  kilogram('kg'),
  hectogram('hg'),
  dekagram('dag'),
  gram('g'),
  decigram('dg'),
  centigram('cg'),
  miligram('mg'),
  microgram('µg'),
  nanogram('ng'),
  megagram('Mg'),
  gigagram('Gg'),
  ounce('oz'),
  pound('lb'),
  ton('ton');

  const MassUnit(this.symbol);

  final String symbol;

  @override
  String get getSymbol => symbol;
}

enum TimeUnit implements Unit<Time> {
  second('s'),
  minute('min'),
  hour('h'),
  day('d'),
  week('w'),
  month('mo'),
  year('y'),
  decade('dec'),
  century('c');

  const TimeUnit(this.symbol);

  final String symbol;

  @override
  String get getSymbol => symbol;
}

enum TemperatureUnit implements Unit<Temperature> {
  kelvin('K'),
  celcius('°C'),
  fahrenheit('°F'),
  reaumur('°R');

  const TemperatureUnit(this.symbol);

  final String symbol;

  @override
  String get getSymbol => symbol;
}

enum ElectricCurrentUnit implements Unit<ElectricCurrent> {
  ampere('A'),
  kiloampere('kA'),
  statampere('statA'),
  miliampere('mA');

  const ElectricCurrentUnit(this.symbol);

  final String symbol;

  @override
  String get getSymbol => symbol;
}

class ConversionNode<T extends BaseQuantity<T>> {
  Unit<T> unit;
  num coefficientProduct;
  num coefficientSum;
  List<ConversionNode<T>> children;

  ConversionNode({
    required this.unit,
    this.coefficientProduct = 1.0,
    this.coefficientSum = 0.0,
    this.children = const [],
  });

  void forEachLevelOrder(void Function(ConversionNode<T> node) performAction) {
    final List<ConversionNode<T>> queue = [];
    performAction(this);
    children.forEach(queue.add);
    var node = queue.removeAt(0);
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.add);
      node = queue.removeAt(0);
    }
  }

  ConversionNode<T> search(Unit<T> unit) {
    late ConversionNode<T> result;
    forEachLevelOrder((node) {
      if (identical(node.unit, unit)) {
        result = node;
      }
    });
    return result;
  }
}

abstract class Tree<T extends BaseQuantity<T>> {}

class LengthConversionTree extends Tree<Length> {
  static ConversionNode<Length> tree = ConversionNode<Length>(
    unit: LengthUnit.meter,
    children: [
      ConversionNode<Length>(
        unit: LengthUnit.kilometer,
        coefficientProduct: pow(10, 3),
        children: [
          ConversionNode<Length>(
            unit: LengthUnit.mile,
            coefficientProduct: 1.60934,
          ),
          ConversionNode<Length>(
            unit: LengthUnit.nauticalMile,
            coefficientProduct: 1.852,
          ),
        ],
      ),
      ConversionNode<Length>(
        unit: LengthUnit.hectometer,
        coefficientProduct: pow(10, 2),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.dekameter,
        coefficientProduct: pow(10, 1),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.decimeter,
        coefficientProduct: pow(10, -1),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.centimeter,
        coefficientProduct: pow(10, -2),
        children: [
          ConversionNode<Length>(
            unit: LengthUnit.inch,
            coefficientProduct: 2.54,
          ),
          ConversionNode<Length>(
            unit: LengthUnit.foot,
            coefficientProduct: 30.48,
          ),
        ],
      ),
      ConversionNode<Length>(
        unit: LengthUnit.milimeter,
        coefficientProduct: pow(10, -3),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.micrometer,
        coefficientProduct: pow(10, -6),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.nanometer,
        coefficientProduct: pow(10, -9),
        children: [
          ConversionNode<Length>(
            unit: LengthUnit.angstrom,
            coefficientProduct: pow(10, 1),
          ),
        ],
      ),
      ConversionNode<Length>(
        unit: LengthUnit.gigameter,
        coefficientProduct: pow(10, 6),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.megameter,
        coefficientProduct: pow(10, 3),
      ),
      ConversionNode<Length>(
        unit: LengthUnit.yard,
        coefficientProduct: 0.9144,
      ),
    ],
  );
}

class Conversion<T extends BaseQuantity<T>> {
  final ConversionNode<T> tree;

  Conversion(this.tree);

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

  ConversionNode<T> _findNodeOfCorrespondingUnit(
    Unit<T> unit,
    ConversionNode<T> node,
  ) {
    if (identical(unit, node.unit)) return node;

    for (ConversionNode<T> child in node.children) {
      print(child.unit.getSymbol);
      if (identical(unit, _findNodeOfCorrespondingUnit(unit, child))) {
        return child;
      }
    }

    return node;
  }

  ConversionNode<T> _lowestCommonAncestor(
    List<ConversionNode<T>> rootFromUnitPath,
    List<ConversionNode<T>> rootToUnitPath,
  ) {
    int shortestListLength = rootFromUnitPath.length < rootToUnitPath.length
        ? rootFromUnitPath.length
        : rootToUnitPath.length;
    for (int i = 0; i < shortestListLength; i++) {
      if (shortestListLength < 2) break;
      if (identical(rootFromUnitPath[i + 1], rootToUnitPath[i + 1])) {
        rootFromUnitPath.removeAt(i);
        rootToUnitPath.removeAt(i);
      } else {
        break;
      }
    }
    return rootFromUnitPath.first;
  }

  num convert(num value, Unit<T> from, Unit<T> to) {
    num result = 0;

    List<ConversionNode<T>> rootFromUnitPath = [];
    List<ConversionNode<T>> rootToUnitPath = [];

    ConversionNode<T> fromNode = _findNodeOfCorrespondingUnit(from, tree);
    ConversionNode<T> toNode = _findNodeOfCorrespondingUnit(to, tree);

    if (_hasPath(tree, fromNode, rootFromUnitPath) &&
        _hasPath(tree, toNode, rootToUnitPath)) {
      print(rootFromUnitPath.first.unit);
      print(rootToUnitPath.first.unit);
      _lowestCommonAncestor(rootFromUnitPath, rootToUnitPath);
    }

    for (int i = 0; i < rootToUnitPath.length - 1; i++) {
      result = (value *
              rootFromUnitPath[i + 1].coefficientProduct /
              rootFromUnitPath[i + 1].coefficientProduct) +
          rootFromUnitPath[i].coefficientSum;
    }

    for (int i = rootFromUnitPath.length - 1; i > 0; i--) {
      result = (value - rootFromUnitPath[i].coefficientSum) *
          rootFromUnitPath[i - 1].coefficientProduct /
          rootFromUnitPath[i - 1].coefficientProduct;
    }

    return result;
  }
}
