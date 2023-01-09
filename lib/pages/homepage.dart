import 'package:flutter/material.dart';
import 'package:deferred_example/pages/samplepage.dart' deferred as box;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> _libraryFuture;

  @override
  void initState() {
    _libraryFuture = box.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _libraryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return box.SamplePage();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Loading component..."),
              SizedBox(
                height: 8,
              ),
              CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}
