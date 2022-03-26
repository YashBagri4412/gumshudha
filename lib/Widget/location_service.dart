import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gumshudha/Widget/post_request_widget.dart';

class LocationService extends StatelessWidget {
  final String? path;
  const LocationService(this.path, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (_, locationSnapshot) {
        if (locationSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (locationSnapshot.hasError) {
          return Center(
            child: Text(locationSnapshot.error.toString()),
          );
        } else {
          Position? position = locationSnapshot.data! as Position?;
          return Center(
            child: PostRequestWidget(latitude: position!.latitude.toInt(), longitude: position.longitude.toInt(), filePath: path,),
          );
        }
      },
      future:
          Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high),
    );
  }
}
