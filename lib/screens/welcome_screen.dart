import 'package:daily_news/screens/home_screen.dart';
import 'package:daily_news/screens/preference_screen.dart';
import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int currentIndex = 0;
  SwiperController swiperController = new SwiperController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: 4,
            controller: swiperController,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return getPages(index);
            },
            loop: false,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    activeSize: 15)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text('Skip'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeScreen();
                }));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              child:
                  Icon(currentIndex != 3 ? Icons.arrow_forward : Icons.check),
              onPressed: () {
                if (currentIndex != 3)
                  swiperController.next();
                else {
                  sharedPrefs.setBool('welcomed', true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomeScreen();
                  }));
                }
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return Material(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/img_0.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Text('TO Daily News App'),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case 1:
        return Material(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add Bookmarks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/img_1.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Text('bookmark your favourite news'),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case 2:
        return Material(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/img_2.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Text('save notes'),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case 3:
        return PreferenceScreen(false);
        break;
      default:
        return Container();
    }
  }



}
