import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_screen.dart';

class PreferenceScreen extends StatefulWidget {
 late bool isHomeScreen;
PreferenceScreen(this.isHomeScreen);
  @override
  _PreferenceScreenState createState() => _PreferenceScreenState(this.isHomeScreen);
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  late bool isHomeScreen;
  _PreferenceScreenState(this.isHomeScreen);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Your Preferences',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 600,
                child: Align(
                  alignment: Alignment.center,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newsCategoriesForUrl.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2,
                      ),
                      itemBuilder: (context,index){
                        return FilterChip(
                          label: Text(newsCategories[index]),
                          selected: prefKeys.contains('pref${newsCategories[index]}'),
                          onSelected: (selected){
                            setState(() {
                              if(selected){
                                sharedPrefs.setBool('pref${newsCategories[index]}', true);
                                updatePrefKeys();
                                print('selected prefkeys $prefKeys');
                              } else{
                                sharedPrefs.remove('pref${newsCategories[index]}');
                                updatePrefKeys();
                               // print(sharedPrefs.getKeys());
                                //sharedPrefs.remove('pref${newsCategories[index]}');


                              //    updateKeys(0,0);

                                print('unselected prefkeys $prefKeys');
                              }
                            });
                          },
                          selectedColor:Colors.red,
                          backgroundColor: Colors.green,
                        );
                      }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(64.0),
                child: isHomeScreen ? Expanded(
                  child: RaisedButton(
                    // color: Theme.of(context).primaryColorDark,
                    // textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                     'Done',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      Fluttertoast.showToast(msg: 'Preferences Changed');
                    },
                  ),
                ) :Text('choose your preferences'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
