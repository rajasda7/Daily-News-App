import 'package:daily_news/screens/home_screen.dart';
import 'package:daily_news/screens/welcome_screen.dart';
import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Daily News App',
    home: GetScreen(),
  ));
}

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);
  @override
  _GetScreenState createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
 bool gotPrefKeys = false;
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return getScreens();
  }

  void getPrefs() async{
    sharedPrefs = await SharedPreferences.getInstance();
    updatePrefKeys();
    updateBookmarkKeys();
    updateNoteKeys();
    if(sharedPrefs.containsKey('welcomed')){
      isWelcomed = true;
    }
    print('first prefkeys $prefKeys');
    setState(() {
      gotPrefKeys = true;
      print('set state called');
    });
  }
  Widget getScreens(){
    if(gotPrefKeys){
      if(isWelcomed){
        return HomeScreen();
      } else{
        return WelcomeScreen();
      }
    } else{
      return Center(child: CircularProgressIndicator(),);
    }
  }
}



