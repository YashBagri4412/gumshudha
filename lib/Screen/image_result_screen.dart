import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gumshudha/Widget/location_service.dart';

class ImageResultScreen extends StatelessWidget {
  final String? path;
  const ImageResultScreen(this.path, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
        ),
        body: FutureBuilder(
          future: Geolocator.requestPermission(),
          builder: (context, permissionSnapshot) {
            if (permissionSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (permissionSnapshot.hasError) {
              return Center(
                child: Text(permissionSnapshot.error.toString()),
              );
            }
            if (permissionSnapshot.hasData) {
              print(permissionSnapshot.data);
            }
            return LocationService(path);
          },
        ));
  }
}
