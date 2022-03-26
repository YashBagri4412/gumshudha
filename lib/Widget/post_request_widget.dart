import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PostRequestWidget extends StatelessWidget {
  String? filePath;
  int latitude;
  int longitude;
  PostRequestWidget(
      {Key? key,
      this.filePath,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  Future<String> _asyncFileUpload(int lat, int long, String file) async {
    //create multipart request for POST or PATCH method

    var request = http.MultipartRequest("POST",
        Uri.parse("http://www.gumshuda-corporate-mondays.herokuapp.com/img"));
    //add location fields
    request.fields["lat"] = lat.toString();
    request.fields["long"] = long.toString();
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file_field", file);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return responseString;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _asyncFileUpload(latitude, longitude, filePath!),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.hasError.toString() + "Helli"),
          );
        }
        return Center(
          child: Text("Kuch hua"),
        );
      },
    );
  }
}
