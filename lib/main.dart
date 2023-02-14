import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/icon_helper.dart';
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
bool toggledTemp = false;

class _MyHomePageState extends State<MyHomePage> {
  Widget _card(Widget child) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 110,
        width: MediaQuery.of(context).size.width * 0.44,
        child: child,
      ),
    );
  }

  Widget _cardRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _card(_cardSkeleton(
            'UV Index',
            tamluk == null
                ? 'loading...'
                : '${(tamluk as CurrentLocation).current?.uv.toString()}',
            'uv.png')),
        _card(_cardSkeleton(
            'Humidity',
            tamluk == null
                ? 'loading...'
                : '${(tamluk as CurrentLocation).current?.humidity.toString()}',
            'humidity.png',
            extraInfo: '%')),
      ],
    );
  }

  Widget _cardRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _card(_cardSkeleton(
            'Wind',
            tamluk == null
                ? 'loading...'
                : '${(tamluk as CurrentLocation).current?.windKph.toString()}',
            'wind.png',
            extraInfo: 'kmph')),
        _card(
          _cardSkeleton(
              'Visibility',
              tamluk == null
                  ? 'loading...'
                  : '${(tamluk as CurrentLocation).current?.visKm.toString()}',
              'visibility.png',
              extraInfo: 'km'),
        ),
      ],
    );
  }

  Widget _cardSkeleton(String badgeString, String info, String imagePath,
      {String? extraInfo}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 233, 233),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(4))),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(badgeString),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            info,
                            style: const TextStyle(
                                fontSize: 40.0,
                                color: Colors.grey,
                                fontFamily: 'Poppins'),
                          ),
                          if (extraInfo != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                extraInfo,
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: WeatherImage.resolveImage(imagePath)),
            ),
          ],
        ),
      ],
    );
  }

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
                        trailing: tamluk == null
                            ? null
                            : WeatherImage.getData((tamluk as CurrentLocation)
                                .current
                                ?.condition
                                ?.code
                                .toString()),
                        title: GestureDetector(
                          onTap: () {
                            toggledTemp = toggledTemp == true ? false : true;
                            setState(() {});
                          },
                          child: Text(
                            tamluk == null
                                ? 'loading...'
                                : toggledTemp
                                    ? '${(tamluk as CurrentLocation).current?.tempF.toString()}°F'
                                    : '${(tamluk as CurrentLocation).current?.tempC.toString()}°C',
                            style: const TextStyle(fontSize: 32.0),
                          ),
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
              ),
              _cardRow1(),
              _cardRow2(),
            ],
          ),
        ),
      ),
    );
  }
}
