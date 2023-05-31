import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/search_button.dart';
import 'package:weather/components/weather_details_item.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(weatherData == null
                  ? 'assets/bg/bg1.jpg'
                  : weatherData!.backgroundSource()),
              fit: BoxFit.cover),
        ),
        child: weatherData == null
            ? SafeArea(
                child: SizedBox(
                  width: 300,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'Secular One',
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  'WELCOME TO \n WEATHER \n APP',
                                  speed: const Duration(milliseconds: 120),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 500),
                        child: SearchButton(
                          color: weatherData == null
                              ? Colors.white
                              : weatherData!.themeColorSource(),
                          width: double.infinity,
                          tapped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weatherData!.avgTemp.toInt()}°',
                    style: TextStyle(
                        color: weatherData == null
                            ? Colors.white
                            : weatherData!.themeColorSource(),
                        fontSize: 150,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                  Text(
                    weatherData!.cityName,
                    style: TextStyle(
                        color: weatherData == null
                            ? Colors.white
                            : weatherData!.themeColorSource(),
                        fontSize: 75,
                        fontFamily: 'Reem Kufi Fun'),
                  ),
                  WeatherDetailsItem(
                    textColor: weatherData == null
                        ? Colors.white
                        : weatherData!.themeColorSource(),
                    firstElement: weatherData!.maxTemp.toInt(),
                    firstText: 'Max',
                    secElement: weatherData!.minTemp.toInt(),
                    secText: 'Min',
                    thirdElement: weatherData!.state,
                    thirdText: 'State',
                    width: double.infinity,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  WeatherDetailsItem(
                    textColor: weatherData == null
                        ? Colors.white
                        : weatherData!.themeColorSource(),
                    firstElement: weatherData!.cloudPercentage,
                    secElement: weatherData!.windPercentage,
                    thirdElement: weatherData!.humidityPercentage.toString(),
                    firstText: 'Cloud',
                    secText: 'Wind',
                    thirdText: 'Humidity',
                    width: double.infinity,
                  ),
                  SearchButton(
                    color: weatherData == null
                        ? Colors.white
                        : weatherData!.themeColorSource(),
                    width: double.infinity,
                    tapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
