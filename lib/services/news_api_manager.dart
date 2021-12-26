import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:daily_news/models/my_news_model.dart';

class NewsApiManager{

  Future<MyNewsModel> getMyNews(String newsUrl) async{
    var client = http.Client();
    var myNewsModel = null;
    var response = await http.get(Uri.parse(newsUrl));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      myNewsModel = MyNewsModel.fromJson(jsonMap);
    } else{
      return myNewsModel;
    }

    return myNewsModel;
  }

}