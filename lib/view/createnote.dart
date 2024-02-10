import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/controller/notecontroller.dart';
import 'package:notes_app/model/note.dart';
import 'package:provider/provider.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

late NoteController _controller;

class _CreateNotePageState extends State<CreateNotePage> {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  List<Color> colors = [
    Colors.blue.shade400,
    Colors.green.shade400,
    Colors.red.shade400,
    Colors.amber.shade400,
    Colors.deepOrange.shade400,
    Colors.deepPurple.shade400,
  ];
  Random random = Random();
  late Color _color;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<NoteController>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // -------  Butto Back ------
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: Colors.grey.shade200,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            // -------  Button Save ------
                            GestureDetector(
                              onTap: ClickSave,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.save_rounded,
                                      color: Colors.grey.shade200,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            // -------  Button Visibility ------
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.visibility_rounded,
                                    color: Colors.grey.shade200,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 15.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titlecontroller,
                      maxLines: 2,
                      minLines: 1,
                      maxLength: 50,
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title...',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextField(
                      controller: descriptioncontroller,
                      maxLines: 10,
                      minLines: 1,
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description...',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ClickSave() {
    setState(() {
      _color = colors[random.nextInt(colors.length)];
    });
    Note note = Note(
      Title: titlecontroller.text,
      Description: descriptioncontroller.text,
      color: _color,
    );
    _controller.AddNote(note: note);
    titlecontroller.text = '';
    descriptioncontroller.text = '';
    Navigator.pop(context);
  }
}
