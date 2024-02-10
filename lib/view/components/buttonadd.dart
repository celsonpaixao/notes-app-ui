import 'package:flutter/material.dart';
import 'package:notes_app/view/createnote.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade800,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: Colors.grey.shade200,
        size: 30,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNotePage(),
            ));
      },
    );
  }
}
