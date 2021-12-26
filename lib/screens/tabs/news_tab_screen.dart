import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:daily_news/screens/news_detail_screen.dart';
import 'package:daily_news/services/news_api_manager.dart';

class NewsTabScreen extends StatefulWidget {
  const NewsTabScreen({Key? key}) : super(key: key);

  @override
  _NewsTabScreenState createState() => _NewsTabScreenState();
}

class _NewsTabScreenState extends State<NewsTabScreen> {

  bool gettingModels = true;

  @override
  void initState() {
    super.initState();
    getNewsModels();
  }

  @override
  Widget build(BuildContext context) {
    print('prefkey length : ${prefKeys.length}');
    return gettingModels ? Center(child: CircularProgressIndicator(),) :
    ListView.builder(
        itemCount: newsCategoriesForUrl.length,
        itemBuilder: (context,index){
          return Column(
            children: [
              Text(newsModelsStored[index].toUpperCase(),style: TextStyle(fontSize: 40),),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsModels[index].articles!.length,//snapshot.data!.totalResults
                itemBuilder: (context,i){
                  var article = newsModels[index].articles![i];
                  var urlToImage = article.urlToImage != null ? article.urlToImage! : 'https://img.etimg.com/thumb/msid-88459657,width-1070,height-580,imgsize-816718,overlay-economictimes/photo.jpg';
                  var articleTitle = article.title != null ? article.title! : 'null';
                  var articleDate = article.publishedAt != null ? article.publishedAt.toString().substring(0,10) : 'null';
                  var articleContent = article.description != null ? article.description! : 'null';
                  var articleAuthor = article.author != null ? article.author! : 'null';
                  var articleUrl = article.url != null ? article.url! : 'null';
                  return ListTile(

                    leading: Image.network(urlToImage,fit: BoxFit.contain,width: 100,height: 80,),
                    title: Text(articleTitle,style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,),
                    subtitle: Text(articleDate),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen( urlToImage,articleTitle,articleDate.toString(),articleAuthor,articleContent,articleUrl)));
                    },
                  );
                },
              ),
            ],
          );
        }
    );
  }




  void getNewsModels() async{
    for(int i=0; i<newsCategoriesForUrl.length; i++){
      String categ = newsCategoriesForUrl[i];
      if(!newsModelsStored.contains(categ)) {
        newsModels.add(await NewsApiManager().getMyNews('$newsUrl$country$category$categ$apiKey'));
        print('$newsUrl$country$category$categ$apiKey');
        newsModelsStored.add(categ);
        print(newsModels[i].totalResults);
        print(newsModels[i].articles!.length);
      }
    }

    gettingModels = false;
    setState(() {});
  }


}
