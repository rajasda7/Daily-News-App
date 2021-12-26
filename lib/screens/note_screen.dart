import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Note1'),),
      body: Column(
        children: [
          Expanded(child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter Title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            ),
          )),
          Expanded(child: TextField(
            decoration: InputDecoration(
                hintText: 'Enter Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            ),
          )),
        ],
      ),
    );
  }
}
