import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/controller/notecontroller.dart';
import 'package:notes_app/view/components/buttonadd.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late NoteController _controller;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<NoteController>(context);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        child: Column(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // -------  Title Appbar ------
                        Text(
                          'Notes',
                          style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),

                        // -------  Actions Appbar ------

                        Row(
                          children: [
                            // -------  Icon Search ------
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.search_sharp,
                                    color: Colors.grey.shade200,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            // -------  Icon Info ------
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.info_outline,
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
            _controller.nota.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/rafikig.png',
                            height: 200,
                          ),
                          Text(
                            'Create your first Note!',
                            style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 28,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: _controller.nota.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        var note = _controller.nota[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 350,
                            height: 700,
                            decoration: BoxDecoration(
                              color: note.color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: PopupMenuButton(
                                    color: Colors.grey.shade800,
                                    iconColor: Colors.white,
                                    splashRadius: 10,
                                    surfaceTintColor: Colors.white,
                                    iconSize: 20,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        value: 'Edit',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'Delet',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        value: 'Delet',
                                      ),
                                    ],
                                    onSelected: (value) {
                                      switch (value) {
                                        case 'Edit':
                                          Navigator.pop(context);
                                          break;

                                        case 'Delet':
                                          _controller.RemoveNote(note: note);
                                          break;
                                      }
                                    },
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          note.Title,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.grey.shade200,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white30,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          note.Description,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.grey.shade200,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: ButtonAdd(),
    );
  }
}
