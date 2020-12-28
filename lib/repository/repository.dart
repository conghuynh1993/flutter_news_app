import 'package:dio/dio.dart';
import 'package:flutter_news_app/model/article_response.dart';
import 'package:flutter_news_app/model/source_response.dart';

class NewsRepository{
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "3c8673ddff2f42eb81b5dfe63aec7be0";

  final Dio _dio = new Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadlinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async{
    var params = {
      "apiKey" : apiKey,
      "language" : "en",
      "country" : "us"
    };
    try{
      Response response = await _dio.get(getSourcesUrl,queryParameters: params);
      return SourceResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occured: $error stacktrace: $stacktrace");
      return SourceResponse.withError(error);
    }
  }

  Future<ArticleResponse> getTopHeadlines() async{
    var params = {
      "apiKey" : apiKey,
      "country" : "us"
    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl,queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getHotNews() async{
    var params = {
      "apiKey" : apiKey,
      "q" : "apple",
      "sortBy" : "popularity"
    };
    try{
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async{
    var params = {
      "apiKey" : apiKey,
      "sources" : sourceId,

    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> search(String searchValue) async{
    var params = {
      "apiKey" : apiKey,
      "q" : searchValue,
      "sortBy": "popularity"
    };
    try{
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      return ArticleResponse.withError(error);
    }
  }
}