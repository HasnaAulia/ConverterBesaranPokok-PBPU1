library unit_converter;

abstract class BaseQuantity<T extends BaseQuantity<T>> {
  num convertFromUnitXtoUnitY({
    required Unit<T> from,
    required Unit<T> to,
  });
}

class Length extends BaseQuantity<Length> {
  final num value;

  Length(this.value);

  @override
  num convertFromUnitXtoUnitY({
    required Unit<Length> from,
    required Unit<Length> to,
  }) {
    return value * to.getRatio / from.getRatio;
  }
}

class Mass extends BaseQuantity<Mass> {
  @override
  num convertFromUnitXtoUnitY({
    required Unit<Mass> from,
    required Unit<Mass> to,
  }) {
    // TODO: implement convertFromUnitXtoUnitY
    throw UnimplementedError();
  }
}

class Time extends BaseQuantity<Time> {
  @override
  num convertFromUnitXtoUnitY({
    required Unit<Time> from,
    required Unit<Time> to,
  }) {
    // TODO: implement convertFromUnitXtoUnitY
    throw UnimplementedError();
  }
}

class Temperature extends BaseQuantity<Temperature> {
  @override
  num convertFromUnitXtoUnitY({
    required Unit<Temperature> from,
    required Unit<Temperature> to,
  }) {
    // TODO: implement convertFromUnitXtoUnitY
    throw UnimplementedError();
  }
}

class ElectricCurrent extends BaseQuantity<ElectricCurrent> {
  @override
  num convertFromUnitXtoUnitY({
    required Unit<ElectricCurrent> from,
    required Unit<ElectricCurrent> to,
  }) {
    // TODO: implement convertFromUnitXtoUnitY
    throw UnimplementedError();
  }
}

abstract class Unit<T extends BaseQuantity<T>> {
  String get getSymbol;
  double get getRatio;
}

enum LengthUnit implements Unit<Length> {
  kilometer('km', 0.001),
  hectometer('hm', 0.01),
  dekameter('dam', 0.1),
  meter('m', 1),
  decimeter('dm', 10),
  centimeter('cm', 100),
  milimeter('mm', 1000);

  const LengthUnit(this.symbol, this.ratio);

  final String symbol;
  final double ratio;

  @override
  String get getSymbol => symbol;

  @override
  double get getRatio => ratio;
}

enum MassUnit implements Unit<Mass> {
  kilogram('kg', 0.001),
  hectogram('hg', 0.01),
  dekagram('dag', 0.1),
  gram('g', 1),
  decigram('dg', 10),
  centigram('cg', 100),
  miligram('mg', 1000);

  const MassUnit(this.symbol, this.ratio);

  final String symbol;
  final double ratio;

  @override
  String get getSymbol => symbol;

  @override
  double get getRatio => ratio;
}

enum TimeUnit implements Unit<Time> {
  hour('h', 1 / 60),
  minute('min', 1),
  second('s', 60);

  const TimeUnit(this.symbol, this.ratio);

  final String symbol;
  final double ratio;

  @override
  String get getSymbol => symbol;

  @override
  double get getRatio => ratio;
}

enum TemperatureUnit implements Unit<Temperature> {
  kelvin('K', 273),
  celcius('C', 5),
  fahrenheit('F', 9),
  reaumur('R', 4);

  const TemperatureUnit(this.symbol, this.ratio);

  final String symbol;
  final double ratio;

  @override
  String get getSymbol => symbol;

  @override
  double get getRatio => ratio;
}

enum ElectricCurrentUnit implements Unit<ElectricCurrent> {
  kiloampere('kA', 0.001),
  hectoampere('hA', 0.01),
  dekagram('daA', 0.1),
  ampere('A', 1),
  deciampere('dA', 10),
  centiampere('cA', 100),
  miliampere('mA', 1000);

  const ElectricCurrentUnit(this.symbol, this.ratio);

  final String symbol;
  final double ratio;

  @override
  String get getSymbol => symbol;

  @override
  double get getRatio => ratio;
}
