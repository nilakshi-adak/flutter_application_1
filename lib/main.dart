import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/current.dart';

import 'service/current_location_service.dart';

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
      home: MyHomePage(title: 'WeatherApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final currentlocationservice = CurrentLocationService();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var tamluk;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.currentlocationservice.getCurrentLocation().then((value) {
        tamluk = value;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(20),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        trailing: Image.asset(
                          'assets/images/cloud_sun.png',
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          tamluk == null
                              ? 'loading...'
                              : '${(tamluk as CurrentLocation).current?.tempC.toString()}°C',
                          style: const TextStyle(fontSize: 32.0),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tamluk == null
                                  ? 'loading...'
                                  : (tamluk as CurrentLocation)
                                          .location
                                          ?.name ??
                                      '',
                              style: const TextStyle(fontFamily: 'Poppins'),
                            ),
                            Text(
                              tamluk == null
                                  ? 'loading...'
                                  : (tamluk as CurrentLocation)
                                          .location
                                          ?.region ??
                                      '',
                              style: const TextStyle(fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
