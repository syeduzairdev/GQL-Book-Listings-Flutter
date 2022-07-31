import 'package:flutter/material.dart';

class DeleteBooks extends StatefulWidget {
  const DeleteBooks({Key? key}) : super(key: key);

  @override
  State<DeleteBooks> createState() => _DeleteBooksState();
}

class _DeleteBooksState extends State<DeleteBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Delete Books'),
        centerTitle: true,
        // backgroundColor: Colors.,
      ),
    );
  }
}
