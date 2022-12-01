import 'package:flutter/material.dart';
import 'package:unit_converter/unit_converter.dart';

class PackageTesting<T extends BaseQuantity<T>> extends StatefulWidget {
  final List<Unit<T>> unitList;

  const PackageTesting({Key? key, required this.unitList}) : super(key: key);

  @override
  State<PackageTesting> createState() => _PackageTestingState<T>();
}

class _PackageTestingState<T extends BaseQuantity<T>>
    extends State<PackageTesting<T>> {
  late Unit<T> _selectedUnitFrom;
  late Unit<T> _selectedUnitTo;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    _selectedUnitFrom = widget.unitList.first;
    _selectedUnitTo = widget.unitList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20 / 375 * MediaQuery.of(context).size.width,
          vertical: 20 / 812 * MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _controller1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('From'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Spacer(),
                DropdownButton<Unit<T>>(
                  value: _selectedUnitFrom,
                  items: List.generate(
                    widget.unitList.length,
                    (index) {
                      return DropdownMenuItem(
                        value: widget.unitList[index],
                        child: Text(
                          widget.unitList[index].symbol,
                        ),
                      );
                    },
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedUnitFrom = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20 / 375 * MediaQuery.of(context).size.width,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                      label: Text('To'),
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                const Spacer(),
                DropdownButton<Unit<T>>(
                  value: _selectedUnitTo,
                  items: List.generate(
                    widget.unitList.length,
                    (index) {
                      return DropdownMenuItem(
                        value: widget.unitList[index],
                        child: Text(
                          widget.unitList[index].symbol,
                        ),
                      );
                    },
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedUnitTo = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20 / 375 * MediaQuery.of(context).size.width,
            ),
            ElevatedButton(
              onPressed: () {
                String result = '';
                switch (T) {
                  case Length:
                    result = Length(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<Length>)
                        .convertTo(_selectedUnitTo as Unit<Length>)
                        .toString();
                    break;
                  case Temperature:
                    result = Temperature(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<Temperature>)
                        .convertTo(_selectedUnitTo as Unit<Temperature>)
                        .toString();
                    break;
                  case Mass:
                    result = Mass(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<Mass>)
                        .convertTo(_selectedUnitTo as Unit<Mass>)
                        .toString();
                    break;
                  case Time:
                    result = Time(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<Time>)
                        .convertTo(_selectedUnitTo as Unit<Time>)
                        .toString();
                    break;
                  case ElectricCurrent:
                    result = ElectricCurrent(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<ElectricCurrent>)
                        .convertTo(_selectedUnitTo as Unit<ElectricCurrent>)
                        .toString();
                    break;
                  case LuminousIntensity:
                    result = LuminousIntensity(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<LuminousIntensity>)
                        .convertTo(_selectedUnitTo as Unit<LuminousIntensity>)
                        .toString();
                    break;
                  case AmountOfSubstance:
                    result = AmountOfSubstance(num.parse(_controller1.text),
                            _selectedUnitFrom as Unit<AmountOfSubstance>)
                        .convertTo(_selectedUnitTo as Unit<AmountOfSubstance>)
                        .toString();
                    break;
                  default:
                }
                _controller2.text = result;
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,
                    45 / 375 * MediaQuery.of(context).size.width),
              ),
              child: const Text("CONVERT"),
            ),
          ],
        ),
      ),
    );
  }
}
