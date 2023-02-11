import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/current.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'WeatherApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var tamluk;
var manali;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () async {
              try {
                var tamluk_response = await Dio().get(
                    'http://api.weatherapi.com/v1/current.json?key=55cf927670004b7aba3134014231102&q=Tamluk&aqi=no');
                print(tamluk_response);
                tamluk = CurrentLocation.fromJson(tamluk_response.data);

                var manali_response = await Dio().get(
                    'http://api.weatherapi.com/v1/current.json?key=55cf927670004b7aba3134014231102&q=Manali&aqi=no');
                print(manali_response);
                manali = CurrentLocation.fromJson(manali_response.data);
                print((manali as CurrentLocation).current?.tempC);

                setState(() {});
              } catch (e) {
                print(e);
              }
              print('Clicked on search');
            },
            icon: const Icon(Icons.search))
      ], title: Text(widget.title)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              elevation: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_city, size: 45),
                    title: const Text('Tamluk'),
                    subtitle: Text(tamluk == null
                        ? 'ggg'
                        : (tamluk as CurrentLocation)
                                .current
                                ?.tempC
                                .toString() ??
                            ''),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city, size: 45),
                    title: const Text('Manali'),
                    subtitle: Text(tamluk == null
                        ? 'ggg'
                        : (manali as CurrentLocation)
                                .current
                                ?.tempC
                                .toString() ??
                            ''),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

getHttp() async {}
