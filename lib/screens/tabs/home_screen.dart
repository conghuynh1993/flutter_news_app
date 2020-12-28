import 'package:flutter/material.dart';
import 'package:flutter_news_app/widgets/headline_slider.dart';
import 'package:flutter_news_app/widgets/hot_news.dart';
import 'package:flutter_news_app/widgets/top_channels.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadlingSliderWidget(),
        Padding(padding: EdgeInsets.all(10),
            child: Text("Top Channels",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),),
        ),
        TopChannels(),
        Padding(padding: EdgeInsets.all(10),
        child: Text("Hot News",style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),
        ),
        HotNewsWidget()
      ],
    );
  }
}
