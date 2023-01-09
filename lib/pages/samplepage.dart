import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 500,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 120,
            width: 120,
            color: index.isEven ? Colors.indigo : Colors.amber,
            child: Image.asset(
              'assets/cat${index + 1}.jpeg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
