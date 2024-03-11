import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:background_location/background_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Timer? locationTimer;

  Future<void> requestPermissions() async {
    // Request location permissions
    var status = await Permission.locationAlways.status;
    if (!status.isGranted) {
      await Permission.locationAlways.request();
    }
  }

  void configureBackgroundLocation() async {
    await BackgroundLocation.setAndroidNotification(
      title: "Location tracking",
      message: "Background location tracking is active.",
      icon: "@mipmap/aeigs_logo",
    );
    await BackgroundLocation.setAndroidConfiguration(1000);
    await BackgroundLocation.stopLocationService();
    await BackgroundLocation.startLocationService(distanceFilter: 10);
  }

  void listenForLocationUpdates() {
    BackgroundLocation.getLocationUpdates((location) {
      locationTimer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
        int count = t.tick;
        print('Timer count: $count');
        print("Location update: ${location.latitude}, ${location.longitude}");
        sendPunchData(location);
      });
    });
  }

  /// send punch data
  Future<void> sendPunchData(Location location) async {
    print("sending data");

    // prefs = await SharedPreferences.getInstance();
    // String? token = prefs?.getString('Authorization');
    Uri url = Uri.parse(
        'https://backendqa.aegishrms.com/route/punch/create/test'); // Replace with your endpoint URL
    try {
      var response = await http.post(
        url,
        headers: {
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImZpcnN0X25hbWUiOiJlZWUiLCJsYXN0X25hbWUiOiJlZWFhIiwiX2lkIjoiNjVkNmY1NThjNDI4ZGI3ZDQyNzkwNGVjIiwiZW1haWwiOiJvcmdhbml6YXRpb25AZ21haWwuY29tIiwicHJvZmlsZSI6WyJFbXBsb3llZSJdLCJvcmdhbml6YXRpb25JZCI6IjY1Y2I0OGQ1N2M4MjhmMTdlOTE4OTFiNCJ9LCJpYXQiOjE3MDk2MTc5MDMsImV4cCI6MTcxMDA0OTkwM30.-O6YDOiPU_WBJakhdYiyDKMVZFJdh5PfYpGiLRJeVwM',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'lng': location.longitude,
          'lat': location.latitude,
        }),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('response body ${response.body}');
      } else {
        print('Failed to send data: ${response.body}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    BackgroundLocation.stopLocationService();
    locationTimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await requestPermissions();
                configureBackgroundLocation();
                listenForLocationUpdates();
              },
              child: Text('Start Location Tracking'),
            ),
            ElevatedButton(
              onPressed: () async {
                await BackgroundLocation.stopLocationService();
                locationTimer!.cancel();
                print('stopped');
              },
              child: Text('stop'),
            ),
          ],
        ),
      ),
    );
  }
}
