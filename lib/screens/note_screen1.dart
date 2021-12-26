import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NoteScreen1 extends StatefulWidget {
  final String appBarTitle;
  final String note;
  NoteScreen1( this.appBarTitle,this.note,);
  @override
  State<StatefulWidget> createState() {
    return NoteScreen1State( this.appBarTitle,this.note,);
  }
}

class NoteScreen1State extends State<NoteScreen1> {
  String appBarTitle;
  String note;
  NoteScreen1State( this.appBarTitle,this.note,);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


   @override
  void initState() {
    super.initState();
    if(appBarTitle == 'Note'){

      try{
        titleController.text = note.substring(4);
        descriptionController.text = sharedPrefs.getString(note)!;
      } catch (e){
        print('printing e: $e');
      }

    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(           // manual back button..
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            moveToLastScreen();
          },
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            // Second Element
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: titleController,
                //style: textStyle,
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: 'Title',
                   // labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),

            // Third Element
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: descriptionController,
             //   style: textStyle,
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: 'Description',
                  //  labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        appBarTitle == 'Note' ? 'Update' : 'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if(appBarTitle == 'Note'){
                          sharedPrefs.remove(note);
                          sharedPrefs.setString('note${titleController.text}', descriptionController.text);
                          updateNoteKeys();
                          Fluttertoast.showToast(msg: 'Note Updated');
                          Navigator.pop(context);
                        } else{
                        sharedPrefs.setString('note${titleController.text}', descriptionController.text);
                        updateNoteKeys();
                        print('texts are : ${titleController.text},${descriptionController.text}');
                        Fluttertoast.showToast(msg: 'Created Note');
                        Navigator.pop(context);

                        }
                      },
                    ),
                  ),
                  Container(
                    width: 5,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void moveToLastScreen(){
    Navigator.pop(context);
  }


}