import 'package:daily_news/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../note_screen1.dart';

class NotesTabScreen extends StatefulWidget {
  const NotesTabScreen({Key? key}) : super(key: key);

  @override
  _NotesTabScreenState createState() => _NotesTabScreenState();
}

class _NotesTabScreenState extends State<NotesTabScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noteKeys.length,
        itemBuilder: (context,index){
        String title = noteKeys.elementAt(index);
        String desc = sharedPrefs.getString(noteKeys.elementAt(index))!;
          return Card(
            elevation: 2.0,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,  // changed during sql crud operation
                  child: Icon(Icons.play_arrow), // changed during sql crud operation
                ),

                title: Text(title.substring(4)),// changed during sql crud operation
                subtitle: Text(desc),// changed during sql crud operation
                trailing: GestureDetector(child: Icon(Icons.delete, color: Colors.grey,), onTap: (){
                  sharedPrefs.remove(title);
                  updateNoteKeys();
                  Fluttertoast.showToast(msg: 'Deleted');
                  setState(() {});
                },),

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen1('Note',title))).then((value) => setState((){}));
                } ),
          );
        }
    );
  }
}
