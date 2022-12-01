import 'package:unit_converter/unit_converter.dart';

class LuminousIntensity extends BaseQuantity<LuminousIntensity> {
  static final ConversionTree<LuminousIntensity> _tree = ConversionTree(
    data: ConversionNode<LuminousIntensity>(
      unit: LuminousIntensityUnit.candela,
      children: [
        ConversionNode<LuminousIntensity>(
          unit: LuminousIntensityUnit.candelaGerman,
          coefficientProduct: 1 / 1.0526315789,
        ),
        ConversionNode<LuminousIntensity>(
          unit: LuminousIntensityUnit.candelaUK,
          coefficientProduct: 1 / 1.0416666667,
        ),
      ],
    ),
  );

  LuminousIntensity(
    num value,
    Unit<LuminousIntensity> unit,
  ) : super(
          value: value,
          unit: unit,
        );

  @override
  num convertTo(
    Unit<LuminousIntensity> to,
  ) {
    return Conversion<LuminousIntensity>(_tree)
        .convert(super.value, super.unit, to);
  }
}
