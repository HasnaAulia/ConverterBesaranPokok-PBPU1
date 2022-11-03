import 'package:flutter/material.dart';
import 'package:unit_converter/unit_converter.dart';

class PackageTesting extends StatefulWidget {
  const PackageTesting({Key? key}) : super(key: key);

  @override
  State<PackageTesting> createState() => _PackageTestingState();
}

class _PackageTestingState extends State<PackageTesting> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

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
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                      child: Text("Satuan 1"),
                    )
                  ],
                  onChanged: (value) {
                    setState(() {});
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
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                      child: Text("Satuan 2"),
                    )
                  ],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20 / 375 * MediaQuery.of(context).size.width,
            ),
            ElevatedButton(
              onPressed: () {
                _controller2.text =
                    Length(num.parse(_controller1.text), LengthUnit.meter)
                        .convertTo(LengthUnit.kilometer)
                        .toString();
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
