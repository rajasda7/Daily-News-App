import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:daily_news/models/own_news_model.dart';

class OwnNewsApiManager{

  Future<List<ArticleModel>> getOwnNews() async{
    var client = http.Client;
   // var ownNewsModel = null;

    var response = await http.get(Uri.parse('hell'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      List<dynamic> body = jsonMap['articles'];
      List<ArticleModel>  articles = body.map((dynamic item) =>  ArticleModel.fromJson(item)).toList();
     // ownNewsModel =OwnNewsModel.fromJson(jsonMap);
      return articles;
    }else{
      var response = await http.get(Uri.parse('hell'));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      List<dynamic> body = jsonMap['articles'];
      List<ArticleModel>  articles = body.map((dynamic item) =>  ArticleModel.fromJson(item)).toList();
      return articles;
    }


  }
}