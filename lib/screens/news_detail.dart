import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news_app/model/article.dart';
import 'package:flutter_news_app/style/theme.dart'as Style;
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatefulWidget {
  final ArticleModel article;
  NewsDetail({Key key, @required this.article}) : super(key: key);
  @override
  _NewsDetailState createState() => _NewsDetailState(article);
}

class _NewsDetailState extends State<NewsDetail> {
  final ArticleModel article;
  _NewsDetailState(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: (){
          launch( article.url);
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width,
          color: Style.Colors.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Read More",style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),)
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Style.Colors.mainColor,
        title: Text(
          article.title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView(
        children: [
          AspectRatio(aspectRatio: 16/9,
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/placeholder.jpg',
                image: article.img,
                fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  article.date.substring(0,10),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Style.Colors.mainColor
                  ),
                ),
                SizedBox(height: 10,),
                  Text(
                    article.title,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                SizedBox(height: 10,),
                Html(data: article.content == null ? "" : article.content)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
