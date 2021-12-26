import 'package:flutter/material.dart';
import 'package:daily_news/models/my_news_model.dart';
import 'package:daily_news/models/own_news_model.dart';
import 'package:daily_news/services/own_news_api_manager.dart';
import 'package:daily_news/services/news_api_manager.dart';
class NewsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _NewPage();
}

class _NewPage extends State<NewsPage>{
  late Future<MyNewsModel> businessModel;
  late Future<MyNewsModel> entertainmentModel;
  late Future<MyNewsModel> sportsModel;
 // late OwnNewsModel _ownNewsModel;
//  late ArticleModel _articleModel;
  late List<ArticleModel> _listArticleModel;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('My News App'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          debugPrint('fab Clicked');
         // _ownNewsModel = await OwnNewsApiManager().getOwnNews();
          _listArticleModel = await OwnNewsApiManager().getOwnNews();
         // _articleModel = await OwnNewsApiManager().getOwnNews();
        //  print('printing ownnewsModel: ${_ownNewsModel.totalResults}');
          print(_listArticleModel[0].urlToImage);
        },
        child:  Icon(Icons.add),
      ),
      body: Container(
        child: ListView(
          children: [
            Text('Business',style: TextStyle(fontSize: 40),),
            businessListView(),
            Text('Entertainment',style: TextStyle(fontSize: 40),),
          entertainmentListView(),
            Text('Sports',style: TextStyle(fontSize: 40),),


          sportsListView()
          ],
        ),
      ),
    );
  }

  Widget businessListView(){
    return  FutureBuilder<MyNewsModel>(
      future: businessModel,
      builder: (context,snapshot){
        if(snapshot.hasData){
          print('total data: ${snapshot.data!.totalResults}');
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,//snapshot.data!.totalResults
            itemBuilder: (context,index){
              var article = snapshot.data!.articles![index];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(article.urlToImage!),
                ),
                title: Text(article.title!),
                subtitle: Text(article.publishedAt!.toString()),
              );
            },
          );
        } else{
          return CircularProgressIndicator();
        }
      },
    );
  }
  Widget entertainmentListView(){
    return  FutureBuilder<MyNewsModel>(
      future: entertainmentModel,
      builder: (context,snapshot){
        if(snapshot.hasData){
          print('total data: ${snapshot.data!.totalResults}');
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,//snapshot.data!.totalResults
            itemBuilder: (context,index){
              var article = snapshot.data!.articles![index];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(article.urlToImage!),
                ),
                title: Text(article.title!),
                subtitle: Text(article.publishedAt!.toString()),
              );
            },
          );
        } else{
          return CircularProgressIndicator();
        }
      },
    );
  }
  Widget sportsListView(){
    return  FutureBuilder<MyNewsModel>(
      future: sportsModel,
      builder: (context,snapshot){
        if(snapshot.hasData){
          print('total data: ${snapshot.data!.totalResults}');
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,//snapshot.data!.totalResults
            itemBuilder: (context,index){
              var article = snapshot.data!.articles![index];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(article.urlToImage!),
                ),
                title: Text(article.title!),
                subtitle: Text(article.publishedAt!.toString()),
              );
            },
          );
        } else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}