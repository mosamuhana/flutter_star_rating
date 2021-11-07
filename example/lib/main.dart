import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smooth Star Rating Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StarRating(
          value: rating,
          size: 32,
          count: 5,
          allowHalfRating: true,
          spacing: 2.0,
          //filledIcon: Icons.star,
          //halfIcon: Icons.star_half,
          //defaultIcon: Icons.star_border,
          onChanged: (x) => setState(() => rating = x),
        ),
      ),
    );
  }
}
