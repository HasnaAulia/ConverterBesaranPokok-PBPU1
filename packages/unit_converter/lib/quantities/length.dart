import 'dart:math';

import '../conversion/conversion.dart';
import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../units/length_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';

class Length extends BaseQuantity<Length> {
  static final ConversionTree<Length> _tree = ConversionTree<Length>(
    data: ConversionNode<Length>(
      unit: LengthUnit.meter,
      children: [
        ConversionNode<Length>(
          unit: LengthUnit.kilometer,
          coefficientProduct: pow(10, -3),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.hectometer,
          coefficientProduct: pow(10, -2),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.dekameter,
          coefficientProduct: pow(10, -1),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.decimeter,
          coefficientProduct: pow(10, 1),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.centimeter,
          coefficientProduct: pow(10, 2),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.milimeter,
          coefficientProduct: pow(10, 3),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.micrometer,
          coefficientProduct: pow(10, 6),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.nanometer,
          coefficientProduct: pow(10, 9),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.gigameter,
          coefficientProduct: pow(10, -9),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.megameter,
          coefficientProduct: pow(10, -6),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.inch,
          coefficientProduct: pow(10, 2) / 2.54,
        ),
        ConversionNode<Length>(
          unit: LengthUnit.foot,
          coefficientProduct: pow(10, 2) / 30.48,
        ),
        ConversionNode<Length>(
          unit: LengthUnit.angstrom,
          coefficientProduct: pow(10, 10),
        ),
        ConversionNode<Length>(
          unit: LengthUnit.yard,
          coefficientProduct: 1 / 0.9144,
        ),
        ConversionNode<Length>(
          unit: LengthUnit.mile,
          coefficientProduct: pow(10, -3) / 1.60934,
        ),
        ConversionNode<Length>(
          unit: LengthUnit.nauticalMile,
          coefficientProduct: pow(10, -3) / 1.852,
        ),
      ],
    ),
  );

  Length(
    num value,
    Unit<Length> unit,
  ) : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<Length> to,
  ) {
    return Conversion<Length>(_tree).convert(super.value, super.unit, to);
  }
}
