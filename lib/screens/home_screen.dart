import 'package:daily_news/screens/preference_screen.dart';
import 'package:daily_news/screens/tabs/bookmarks_tab_screen.dart';
import 'package:daily_news/screens/tabs/home_tab_screen.dart';
import 'package:daily_news/screens/tabs/news_tab_screen.dart';
import 'package:daily_news/screens/tabs/notes_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'note_screen1.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Daily News App'), actions: [
        PopupMenuButton(
          onSelected: (item){
            print('item: $item');
            if(item == 0){
              Navigator.push(context, MaterialPageRoute(builder:(context) => PreferenceScreen(true)));
            }
            if(item == 1){
              Share.share('https://visheshk27.github.io/Dailynews/');
            }
          },
          itemBuilder: (context){
           return [
             PopupMenuItem(value:0,child: Text('Change Preferences')),
             PopupMenuItem(value:1,child: Text('Share this App')),
           ];
          },
        )
      ],),
      drawer: Drawer(
        child:Column(
          children: <Widget>[
            SafeArea(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/icondrawer.png', height: 80,),
            )),
            ListTile(leading: Icon(Icons.home),title: Text('Home'),onTap: (){
              setState(() {
                Navigator.pop(context);
                currentIndex = 0;
              });

            },),
            ListTile(leading: Icon(Icons.category),title: Text('All News'),onTap: (){setState(() {
              Navigator.pop(context);
              currentIndex = 1;
            });},),
            ListTile(leading: Icon(Icons.bookmark),title: Text('Bookmarks'),onTap: (){setState(() {
              Navigator.pop(context);
              currentIndex = 2;
            });},),
            ListTile(leading: Icon(Icons.note_sharp),title: Text('Notes'),onTap: (){setState(() {
              Navigator.pop(context);
              currentIndex = 3;
            });},),
            ListTile(leading: Icon(Icons.favorite),title: Text('Share this App'),onTap: (){Share.share('https://visheshk27.github.io/Dailynews/');},),

          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: currentIndex == 3? true : false,
        child: FloatingActionButton(
          onPressed: (){
           // print('added chip enterntenmemt ${Strings().selectedPreferences}');
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context){
                return NoteScreen1('New Note','null');
              }
            )).then((value) => setState((){}));
          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (selectedIndex){
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: 'News'),
           BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: 'Bookmarks'),
           BottomNavigationBarItem(icon: Icon(Icons.note),label: 'Notes'),
        ],
      ),
      body: getTabScreen(),
    );
  }

  Widget getTabScreen(){
    switch(currentIndex){
      case 0:
        return HomeTabScreen();
        break;
      case 1:
        return NewsTabScreen();
        break;
      case 2:
        return BookmarksTabScreen();
        break;
      case 3:
        return NotesTabScreen();
        break;
      default:
        return Container();
    }
  }



}
