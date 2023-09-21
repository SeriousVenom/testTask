
import 'package:flutter/material.dart';
import 'package:test_task/UI/widgets/form_widget.dart';
import 'package:test_task/UI/widgets/weather_card.dart';
import 'package:test_task/repositories/models/weather_model.dart';
import 'package:test_task/repositories/weather_repository.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityController = TextEditingController();
  WeatherModel? weatherModel;
  String? iconURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Screen'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.orange.shade900],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
        child: Builder(builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
            child: Column(
              children: [
                FormWidget(
                  hintTitle: 'Enter city',
                  inputType: TextInputType.text,
                  controller: cityController,
                  color: Colors.white,
                  onPressed: (val) => _getWeather(),
                ),
                const SizedBox(height: 24.0),
                if (weatherModel != null)
                  WeatherCard(
                    weatherModel: weatherModel,
                    iconURL: iconURL,
                    onPressed: () => _getWeather(),
                  ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _getWeather() async {
    var weatherResponse =
        await WeatherRepository().getWeather(cityController.text);
    setState(() {
      weatherModel = weatherResponse;
      iconURL = 'https:${weatherModel?.current.condition.icon}';
    });
  }
}
