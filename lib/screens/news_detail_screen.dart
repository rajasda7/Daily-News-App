import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsDetailScreen extends StatefulWidget {

  String imgUrl;
  String title;
  String date;
  String author;
  String content;
  String url;
  NewsDetailScreen(this.imgUrl,this.title,this.date,this.author,this.content,this.url);
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState(this.imgUrl,this.title,this.date,this.author,this.content,this.url);
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late SharedPreferences prefs;
  String imgUrl;
  String content;
  String title;
  String date;
  String author;
  String url;
  _NewsDetailScreenState(this.imgUrl,this.title,this.date,this.author,this.content,this.url);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefs();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              leading: GestureDetector(onTap:(){ Navigator.pop(context);},child: Icon(Icons.arrow_back,size: 30,)),
              actions: [
                GestureDetector(onTap:(){
                  Share.share(url);
                }, child: Icon(Icons.share,size: 30,)),
                GestureDetector(onTap:(){
                  setState(() {
                    if(bookmarksKeys.contains('book$imgUrl')){
                      sharedPrefs.remove('book$imgUrl');
                      updateBookmarkKeys();
                      Fluttertoast.showToast(msg: 'removed from bookmarks');
                    } else {
                      sharedPrefs.setStringList('book$imgUrl', [imgUrl,title,date,author,content,url]);
                      updateBookmarkKeys();
                      Fluttertoast.showToast(msg: 'Bookmarked Successfully');
                      print("bookmarked successfully ");
                    }
                  });

                //  print(sharedPrefs.getStringList(imgUrl));


                //  prefs.setStringList(imgUrl, [imgUrl,title,date,author,content]);
                },child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.bookmark, size: 30,),
                ))
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(imgUrl,height: double.infinity,),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Text(title,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22,decoration: TextDecoration.none, color: Colors.black ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row( children: [Expanded(child: Text('Date: $author',style: TextStyle(fontSize: 15,decoration: TextDecoration.none),)), Expanded(child: Text('Author: $date',style: TextStyle(fontSize: 15,decoration: TextDecoration.none),))],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$content $content $content $content',style: TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.grey),),
                    ),
                  ],
                ),
              ))
          ],
        ),
    );
  }
  void getPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }
}
