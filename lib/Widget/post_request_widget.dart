import 'dart:convert';

import 'package:gumshudha/Model/from_post.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<FromPost> _asyncFileUpload(int lat, int long, String file) async {
    //create multipart request for POST or PATCH method

    // var request =
    //     http.MultipartRequest("POST", Uri.parse("http://84bc-106-51-8-242.ngrok.io/img"));
    // //add location fields
    // //request.fields["lat"] = lat.toString();
    // //request.fields["long"] = long.toString();
    // //create multipart using filepath, string or bytes
    // var pic = await http.MultipartFile.fromPath("file_field", file);
    // //add multipart to request
    // request.files.add(pic);
    // var response = await request.send();
    // //Get the response from the server
    // var responseData = await response.stream.toBytes();
    // var responseString = String.fromCharCodes(responseData);
    // print(responseString);
    // return responseString;
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://29c1-106-51-8-242.ngrok.io/img'));
    request.files.add(await http.MultipartFile.fromPath('image', filePath!));

    http.StreamedResponse response = await request.send();
    var newResponse = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      return FromPost.fromJson(jsonDecode(newResponse.body));
    } else {
      return FromPost(Results: "Match", Name: "Rishabh", ImageLink: "test");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _asyncFileUpload(latitude, longitude, filePath!),
      builder: (BuildContext context, AsyncSnapshot<FromPost> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error.toString() + " Error from rest api");
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          FromPost? result = snapshot.data as FromPost;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Image is Matched"),
                Text("Name of the pic : ${result.Name}"),
                Text(result.ImageLink!),
                TextButton(
                    onPressed: () async {
                      const url = 'https://flutter.io';
                      if (await canLaunch(result.ImageLink!)) {
                        await launch(result.ImageLink!);
                      } else {
                        throw 'Could not launch ${result.ImageLink!}';
                      }
                    },
                    child: Text(result.ImageLink!))
              ],
            ),
          );
        }
        return Center(
          child: Text('some issue'),
        );
      },
    );
  }
}
