import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gumshudha/Screen/image_result_screen.dart';
import 'package:image_picker/image_picker.dart';

class ImageCaptureScreen extends StatefulWidget {
  const ImageCaptureScreen({Key? key}) : super(key: key);
  @override
  createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  XFile? _imageFile;

  Future<void> _pickImg(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? selected = await picker.pickImage(source: source);
    print(selected!.path);
    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Click the image")),
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              icon: const Icon(Icons.photo_camera, size: 30.00),
              onPressed: () => _pickImg(ImageSource.camera),
              splashColor: Colors.cyan,
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              icon: const Icon(
                Icons.photo_library,
                size: 30.00,
              ),
              splashColor: Colors.cyan,
              onPressed: () => _pickImg(ImageSource.gallery),
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: _imageFile == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_imageFile != null) ...[
            Container(
              height: MediaQuery.of(context).size.height * 0.61,
              width: MediaQuery.of(context).size.width * 0.70,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.file(
                  File(_imageFile!.path),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.70,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Wrap(
                      children: const <Widget>[
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Retake", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onPressed: () async {
                      await _pickImg(ImageSource.camera);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Wrap(
                      children: const <Widget>[
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Submit", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImageResultScreen(_imageFile!.path),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ] else ...[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Wrap(
                  children: const <Widget>[
                    Icon(
                      Icons.upload,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Tap to click the Image",
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
                onPressed: () async {
                  await _pickImg(ImageSource.camera);
                },
              ),
            ),
          ]
        ],
      ),
    );
  }
}
