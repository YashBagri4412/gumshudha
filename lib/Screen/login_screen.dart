import 'package:flutter/material.dart';
import 'package:gumshudha/Screen/image_capture_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter some Text',
                        ),
                      ),
                    );
                  }
                  // return 'Please enter some Text';
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter some Text',
                        ),
                      ),
                    );
                  }
                  // return 'Please enter some Text';
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ImageCaptureScreen()));
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
