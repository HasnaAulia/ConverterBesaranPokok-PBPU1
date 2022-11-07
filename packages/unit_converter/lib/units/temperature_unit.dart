import '../quantities/temperature.dart';
import 'unit.dart';

enum TemperatureUnit implements Unit<Temperature> {
  kelvin('K'),
  celsius('°C'),
  fahrenheit('°F'),
  reaumur('°R');

  const TemperatureUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
