import 'package:flutter/material.dart';
import 'package:light_sensor/light_sensor.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    _initializeLightSensor();
  }

  void _initializeLightSensor() async {
    final bool hasSensor = await LightSensor.hasSensor();
    if (hasSensor) {
      LightSensor.luxStream().listen((int lux) {
        // Here you can handle the sensor data as needed
        // For example, you might update a database, send data to a server, or just log it
        print(
            'Current LUX level: $lux'); // This prints the LUX value to the console
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty container as no UI elements are required
    return Container();
  }
}
