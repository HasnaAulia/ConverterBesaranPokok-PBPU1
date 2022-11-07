import '../quantities/time.dart';
import 'unit.dart';

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

  const TimeUnit(this.sym);

  final String sym;

  @override
  String get symbol => sym;
}
