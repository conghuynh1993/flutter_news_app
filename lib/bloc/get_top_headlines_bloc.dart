import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/article_response.dart';
import 'package:flutter_news_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadlinesBloc{
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();

  getHeadlines() async{
    ArticleResponse response = await _repository.getTopHeadlines();
    _subject.sink.add(response);
  }

  void drainStream() {_subject.value = null;}

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}
final getTopHeadlinesBloc = GetTopHeadlinesBloc();