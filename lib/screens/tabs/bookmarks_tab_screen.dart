import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import '../news_detail_screen.dart';

class BookmarksTabScreen extends StatefulWidget {
  const BookmarksTabScreen({Key? key}) : super(key: key);
  @override
  _BookmarksTabScreenState createState() => _BookmarksTabScreenState();
}

class _BookmarksTabScreenState extends State<BookmarksTabScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookmarksKeys.length,//snapshot.data!.totalResults
      itemBuilder: (context,i){
       // var article = newsModels[index].articles![i];
        List<String> items = sharedPrefs.getStringList(bookmarksKeys.elementAt(i))!;
        var urlToImage = items[0] != null ? items[0] : 'https://img.etimg.com/thumb/msid-88459657,width-1070,height-580,imgsize-816718,overlay-economictimes/photo.jpg';
        var articleTitle = items[1] != null ? items[1] : 'null';
        var articleDate = items[2] != null ? items[2] : 'null';
        var articleContent = items[4] != null ? items[4] : 'null';
        var articleAuthor = items[3] != null ? items[3] : 'null';
        var articleUrl = items[5] != null ? items[5] : 'null';
        return ListTile(

          leading: Image.network(urlToImage,fit: BoxFit.contain,width: 100,height: 80,),
          title: Text(articleTitle,style: TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,),
          subtitle: Text(articleDate),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen( urlToImage,articleTitle,articleDate.toString(),articleAuthor,articleContent,articleUrl))).then((value) => setState((){}));
          },
        );
      },
    );

  }

}
