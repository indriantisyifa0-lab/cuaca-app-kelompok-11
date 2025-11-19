import 'dart:math';
import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WeatherModel> weathers = [
    WeatherModel(city: "Jakarta", temperature: 30, condition: "Cerah", icon: "☀️"),
    WeatherModel(city: "Bandung", temperature: 25, condition: "Berawan", icon: "☁️"),
    WeatherModel(city: "Bogor", temperature: 23, condition: "Hujan", icon: "🌧️"),
    WeatherModel(city: "Surabaya", temperature: 33, condition: "Panas", icon: "🌥️"),
  ];

  void updateWeather() {
    final random = Random();

    setState(() {
      for (var w in weathers) {
        w.temperature = 20 + random.nextInt(15);

        final kondisi = ["Cerah", "Berawan", "Hujan", "Panas"];
        final ikon = ["☀️", "☁️", "🌧️", "🌥️"];

        int x = random.nextInt(4);
        w.condition = kondisi[x];
        w.icon = ikon[x];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Cuaca Hari Ini",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: ListView.builder(
            key: ValueKey(weathers.map((e) => e.temperature).join()),
            itemCount: weathers.length,
            itemBuilder: (context, index) {
              return WeatherCard(weather: weathers[index]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: updateWeather,
          backgroundColor: Colors.white,
          icon: const Icon(Icons.refresh, color: Colors.blue),
          label: const Text("Perbarui", style: TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }
}
