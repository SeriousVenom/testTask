import 'package:flutter/material.dart';
import 'package:test_task/repositories/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weatherModel,
    required this.iconURL,
    required this.onPressed,
  });

  final WeatherModel? weatherModel;
  final String? iconURL;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${weatherModel?.location.name} / ${weatherModel?.location.country}' ??
                      'City not selected',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${weatherModel?.location.localtime}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Image.network(iconURL!),
                    Column(
                      children: [
                        Text(
                          '${weatherModel?.current.tempC} c',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${weatherModel?.current.tempF} f',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 32,
                ))
          ],
        ),
      ),
    );
  }
}
