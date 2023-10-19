import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppStoreHome(),
    );
  }
}

class AppStoreHome extends StatefulWidget {
  @override
  _AppStoreHomeState createState() => _AppStoreHomeState();
}

class _AppStoreHomeState extends State<AppStoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, // Keeps the app bar visible while scrolling
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: AnimatedTitle(),
              background: Image.network(
                'https://via.placeholder.com/400x200', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 300),
      builder: (BuildContext context, double value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'App Store', // Your app title
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
